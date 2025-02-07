//
//  ActorDetailVC.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import UIKit

class ActorDetailVC: UIViewController {
    let viewModel = ActorDetailViewModel()
    
    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 16, left: 16, bottom: 16, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    private let table: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configConstraints()
        configViewModel()
    }
    
    private func configUI() {
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.register(ActorDetailCell.self, forCellReuseIdentifier: "cell")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    func config(data: [KnownFor]) {
        viewModel.knownFor = data
    }
    
    private func configViewModel() {
       
    }
}

extension ActorDetailVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.knownFor.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ActorDetailCell
        cell.config(data: viewModel.knownFor[indexPath.row])
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        .init(width: 168, height: 250)
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let controller = MovieDetailVC()
//        navigationController?.show(controller, sender: nil)
//    }
}
