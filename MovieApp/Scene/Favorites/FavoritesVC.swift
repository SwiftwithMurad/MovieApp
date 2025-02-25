//
//  FavoritesVC.swift
//  MovieApp
//
//  Created by Mac on 21.02.25.
//

import UIKit

class FavoritesVC: UIViewController {
    let viewModel = FavoritesViewModel()
    
    private let refresh: UIRefreshControl = {
        let refresh = UIRefreshControl()
        return refresh
    }()
    
    private let table: UITableView = {
        let table = UITableView()
        table.allowsSelection = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configCostraints()
        configViewModel()
    }
    
    private func configUI() {
        title = "Favorites"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(table)
        table.delegate = self
        table.dataSource = self
        table.register(ActorDetailCell.self, forCellReuseIdentifier: "cell")
        table.refreshControl = refresh
        refresh.addTarget(self, action: #selector(refreshPage), for: .valueChanged)
    }
    
    private func configCostraints() {
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    private func configViewModel() {
        viewModel.success = { [weak self] in
            guard let self = self else { return }
            table.reloadData()
            refresh.endRefreshing()
        }
        viewModel.errorHandling = { error in
            print(error)
        }
        viewModel.getDocument()
    }
    
    @objc func refreshPage() {
        viewModel.reset()
        table.reloadData()
    }
}

extension FavoritesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movieDetail.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ActorDetailCell
        cell.config(data: viewModel.movieDetail[indexPath.row])
        return cell
    }
}
