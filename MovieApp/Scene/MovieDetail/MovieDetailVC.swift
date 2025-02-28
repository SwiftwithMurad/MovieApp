//
//  MovieDetailVC.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import UIKit

class MovieDetailVC: UIViewController {
    let viewModel: MovieDetailViewModel
    
    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    init(viewModel: MovieDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configConstraints()
        configViewModel()
    }
    
    private func configUI() {
        view.backgroundColor = .systemGray5
        view.addSubview(collection)
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .systemGray5
        collection.register(MovieDetailCell.self, forCellWithReuseIdentifier: "cell")
        collection.register(MovieDetailHeader.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "header")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "bookmark"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(bookmarkButtonTapped))
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }
    
    private func configViewModel() {
        viewModel.success = { [weak self] in
            guard let self = self else { return }
            collection.reloadData()
        }
        viewModel.errorHandling = { error in
            print(error)
        }
        viewModel.getMovieDetail()
        viewModel.getSimilarMovies()
        viewModel.showTrailer()
    }
    
    @objc func bookmarkButtonTapped() {
        viewModel.addDataToFireStore()
        UserDefaults.standard.set(true, forKey: viewModel.movieModel?.movieName ?? "")
    }
}

extension MovieDetailVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieDetailCell
        cell.configMovie(result: viewModel.movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 365)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath) as! MovieDetailHeader
        guard let movie = viewModel.movieModel else { return header }
        header.configHeader(movie: movie)
        header.handleButton = { [weak self] in
            guard let self = self else { return }
            let key = viewModel.trailer.filter({ $0.type == .trailer })[indexPath.row].key ?? ""
            let controller = TrailerVC(viewModel: .init(key: key))
            navigationController?.show(controller, sender: nil)
        }
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        .init(width: collectionView.frame.width, height: 560)
    }
}
