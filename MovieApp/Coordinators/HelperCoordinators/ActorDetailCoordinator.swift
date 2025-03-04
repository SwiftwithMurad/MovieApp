//
//  ActorDetailCoordinator.swift
//  MovieApp
//
//  Created by Mac on 04.03.25.
//

import UIKit
import Foundation

final class ActorDetailCoordinator: Coordinator {
    var navigationController: UINavigationController
    var id: Int
    var actorManager: ActorManagerUseCase
    var title: String
    
    init(navigationController: UINavigationController, id: Int, title: String ,actorManager: ActorManagerUseCase) {
        self.navigationController = navigationController
        self.id = id
        self.title = title
        self.actorManager = actorManager
    }
    
    func start() {
        let controller = ActorDetailVC(viewModel: .init(id: id, actorManager: actorManager))
        controller.title = title
        navigationController.show(controller, sender: nil)
    }
    
    
}
