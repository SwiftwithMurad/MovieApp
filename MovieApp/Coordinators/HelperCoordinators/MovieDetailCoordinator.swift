//
//  MovieDetailCoordinator.swift
//  MovieApp
//
//  Created by Mac on 28.02.25.
//

import UIKit
import Foundation

final class MovieDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var id: Int
    
    init(id: Int ,navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.id = id
    }
    
    func start() {
        let controller = MovieDetailVC(viewModel: .init(id: id))
        navigationController.show(controller, sender: nil)
    }
}
