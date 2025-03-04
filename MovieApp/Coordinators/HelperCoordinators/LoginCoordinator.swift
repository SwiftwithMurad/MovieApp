//
//  LoginCoordinator.swift
//  MovieApp
//
//  Created by Mac on 01.03.25.
//

import UIKit
import Foundation

class LoginCoordinator: Coordinator {
    var window: UIWindow?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController, window: UIWindow?) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func start() {
        let controller = LoginVC()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
    }
}
