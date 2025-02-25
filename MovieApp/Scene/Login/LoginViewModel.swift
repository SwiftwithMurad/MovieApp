//
//  LoginViewModel.swift
//  MovieApp
//
//  Created by Mac on 20.02.25.
//

import Foundation
import UIKit

class LoginViewModel {
    let authManager = AuthManager()
    
    func config(email: String, password: String) {
        if !email.isEmpty && !password.isEmpty {
            authManager.authenticateUser(email: email,
                                         password: password) { message in
                if let message {
                    print(message)
                } else {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
                       let sceneDelegate = windowScene.delegate as? SceneDelegate {
                        sceneDelegate.tabBarRoot()
                    }
                }
            }
        }
    }
}

