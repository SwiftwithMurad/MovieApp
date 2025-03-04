//
//  TabBarCoordinator.swift
//  MovieApp
//
//  Created by Mac on 28.02.25.
//

import UIKit
import Foundation

final class TabBarCoordinator: Coordinator {
    var window: UIWindow?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        let tabBarController = TabBar()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
