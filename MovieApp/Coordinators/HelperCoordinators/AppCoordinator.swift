//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by Mac on 28.02.25.
//

import UIKit
import Foundation

final class AppCoordinator: Coordinator {
    let window: UIWindow?
    var childCoordinator: [Coordinator]?
    var navigationController: UINavigationController
    
    init(window: UIWindow?, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        if UserDefaults.standard.bool(forKey: "isLoggedIn") && UserDefaults.standard.string(forKey: "userId") != nil {
            tabBarRoot()
        } else {
            loginRoot()
        }
    }
    
    func tabBarRoot() {
        let tabBarCoordinator = TabBarCoordinator(navigationController: navigationController,
                                                  window: window)
        tabBarCoordinator.start()
    }
    
    func loginRoot() {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController,
                                                window: window)
        loginCoordinator.start()
    }
}


