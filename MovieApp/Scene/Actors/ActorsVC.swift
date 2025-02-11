//
//  ActorsController.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import UIKit

class ActorsVC: UIViewController {
    private let viewModel = ActorsViewModel()
    
    private lazy var search: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.obscuresBackgroundDuringPresentation = false
        search.searchResultsUpdater = self
        return search
    }()
    
    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 16, bottom: 20, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
        title = "Actors"
        navigationItem.searchController = search
        search.searchBar.delegate = self
        view.addSubview(collection)
        collection.delegate = self
        collection.dataSource = self
        collection.register(ImageLabelCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configViewModel() {
        viewModel.getActors()
        viewModel.errorHandling = { error in
            print(error)
        }
        viewModel.success = { [weak self] in
            guard let self = self else { return }
            collection.reloadData()
        }
    }
}

extension ActorsVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.actor.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageLabelCell
        cell.config(data: viewModel.actor[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ActorDetailVC()
        controller.viewModel.id = viewModel.allActors[indexPath.row].id
        controller.title = viewModel.allActors[indexPath.row].name
        navigationController?.show(controller, sender: nil)
    }
}

extension ActorsVC: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else {
            viewModel.actor = viewModel.allActors
            collection.reloadData()
            return
        }
        viewModel.actor = viewModel.allActors.filter({ $0.name?.lowercased().contains(text.lowercased()) ?? false })
        collection.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.actor = viewModel.allActors
        collection.reloadData()
    }
    
    func willPresentSearchController(_ searchController: UISearchController) {
        UIView.animate(withDuration: 0.3) {
            self.collection.contentInset = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0)
        }
    }

    func willDismissSearchController(_ searchController: UISearchController) {
        UIView.animate(withDuration: 0.3) {
            self.collection.contentInset = .zero
        }
    }
}
