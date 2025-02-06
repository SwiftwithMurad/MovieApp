//
//  ActorsController.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import UIKit

class ActorsVC: UIViewController {
    private let viewModel = ActorsViewModel()
    
    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
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
        .init(width: 168, height: 220)
    }
}
