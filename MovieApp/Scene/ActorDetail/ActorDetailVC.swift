//
//  ActorDetailVC.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import UIKit

class ActorDetailVC: UIViewController {
    let viewModel = ActorDetailViewModel()
    
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
    
    private func configViewModel() {
        viewModel.getActorMovies()
        viewModel.errorHandling = { error in
            print(error)
        }
        viewModel.success = { [weak self] in
            guard let self = self else { return }
            table.reloadData()
        }
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
