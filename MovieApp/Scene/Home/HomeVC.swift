//
//  HomeVC.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import UIKit

class HomeVC: UIViewController {
    private let viewModel = HomeViewModel()
    
    private lazy var collection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
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
    
    fileprivate func configUI() {
        navigationItem.title = "Movies"
        self.navigationController?.navigationBar.prefersLargeTitles = true        
        view.addSubview(collection)
        collection.register(HomeCell.self, forCellWithReuseIdentifier: "cell")
        collection.delegate = self
        collection.dataSource = self
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
        viewModel.getAllData()
        viewModel.errorHandling = { [weak self] error in
            guard let self = self else { return }
            let alertController = UIAlertController(title: "Error", message: "Data couldn't be read", preferredStyle: .alert)
            let action = UIAlertAction(title: "Ok", style: .cancel)
            alertController.addAction(action)
            present(alertController, animated: true)
        }
        viewModel.success = { [weak self] in
            guard let self = self else { return }
            collection.reloadData()
        }
    }
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.home.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! HomeCell
        let model = viewModel.home[indexPath.row]
        cell.configCell(name: model.title ?? "", data: model.items)
        cell.handleButton = { [weak self] in
            guard let self = self else { return }
            let controller = SeeAllVC()
            controller.title = model.title ?? ""
            controller.viewModel.getData(movie: model.items)
            navigationController?.show(controller, sender: nil)
        }
        cell.handleCell = { [weak self] movie in
            guard let self = self else { return }
            let controller = MovieDetailVC()
            controller.configMovie(movie: movie)
            navigationController?.show(controller, sender: nil)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 340)
    }
}
