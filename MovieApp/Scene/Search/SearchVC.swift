//
//  SearchVC.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import UIKit

class SearchVC: UIViewController {
    let viewModel = SearchViewModel()
    
    private let searchView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.systemBlue.cgColor
        view.layer.cornerRadius = 30
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var searchField: UITextField = {
        let field = UITextField()
        field.placeholder = "Search"
        field.font = .systemFont(ofSize: 14, weight: .regular)
        field.addTarget(nil, action: #selector(fieldConfiguration), for: .editingChanged)
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    private let searchImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "magnifyingglass")
        image.tintColor = .black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
     }()
    
    private let refreshControl: UIRefreshControl = {
        let refresh = UIRefreshControl()
        return refresh
    }()

    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 32, left: 16, bottom: 32, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .systemGray5
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configConstraints()
        configViewModel()
    }

    private func configUI() {
        title = "Search"
        view.backgroundColor = .systemGray5
        [searchView, collection].forEach { view.addSubview($0) }
        [searchField, searchImage].forEach { searchView.addSubview($0) }
        collection.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshSearch), for: .valueChanged)
        collection.delegate = self
        collection.dataSource = self
        collection.register(ImageLabelCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            searchView.widthAnchor.constraint(equalToConstant: 354),
            searchView.heightAnchor.constraint(equalToConstant: 60),
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 36),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            searchImage.widthAnchor.constraint(equalToConstant: 25),
            searchImage.heightAnchor.constraint(equalToConstant: 25),
            searchImage.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchImage.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 20),
            
            searchField.centerYAnchor.constraint(equalTo: searchImage.centerYAnchor),
            searchField.centerYAnchor.constraint(equalTo: searchImage.centerYAnchor),
            searchField.leadingAnchor.constraint(equalTo: searchImage.leadingAnchor, constant: 48),
            searchField.widthAnchor.constraint(equalToConstant: 270),
            
            collection.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 32),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    @objc func fieldConfiguration() {
        if let search = searchField.text, !search.isEmpty {
            viewModel.getAllMovies(name: searchField.text ?? "")
        } else {
            viewModel.resetMovies()
            collection.reloadData()
        }
    }
    
    @objc func refreshSearch() {
        viewModel.resetMovies()
        viewModel.getAllMovies(name: searchField.text ?? "")
        collection.reloadData()
    }
    
    private func configViewModel() {
        viewModel.errorHandling = { [weak self] error in
            guard let self = self else { return }
            print(error)
            refreshControl.endRefreshing()
        }
        viewModel.success = { [weak self] in
            guard let self = self else { return }
            collection.reloadData()
            refreshControl.endRefreshing()
        }
    }
}

extension SearchVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageLabelCell
        let model = viewModel.movie[indexPath.row]
        cell.config(data: model)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = MovieDetailVC(viewModel: .init(id: viewModel.movie[indexPath.row].id ?? 0))
        navigationController?.show(controller, sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        viewModel.paginate(page: indexPath.row, name: searchField.text ?? "")
    }
}
