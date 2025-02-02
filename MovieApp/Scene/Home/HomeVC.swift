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
    
    private func configUI() {
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
        viewModel.errorHandling = { error in
            print(error)
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
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 320)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = MovieDetailVC()
        navigationController?.show(controller, sender: nil)
    }
}
