//
//  SeeAllCoordinator.swift
//  MovieApp
//
//  Created by Mac on 01.03.25.
//

import UIKit
import Foundation

class SeeAllCoordinator: Coordinator {
    var navigationController: UINavigationController
    var movies: [MovieResult]
    var managerUseCase: MovieManagerUseCase
    var selectedType: String
    
    init(navigationController: UINavigationController, movies: [MovieResult], managerUseCase: MovieManagerUseCase, selectedType: String) {
        self.navigationController = navigationController
        self.movies = movies
        self.managerUseCase = managerUseCase
        self.selectedType = selectedType
    }
    
    func start() {
        let controller = SeeAllVC(viewModel: .init(movie: movies,
                                                   movieManager: managerUseCase,
                                                   selectedType: selectedType))
        navigationController.show(controller, sender: nil)
    }
    
    
}
