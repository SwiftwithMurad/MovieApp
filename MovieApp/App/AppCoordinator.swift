//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by Mac on 28.02.25.
//

import UIKit
import Foundation

class AppCoordinator: Coordinator {
    var window: UIWindow?
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
        let controller = TabBar()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
    
    func loginRoot() {
        let controller = LoginVC()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}


