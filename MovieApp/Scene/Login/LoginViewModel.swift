//
//  LoginViewModel.swift
//  MovieApp
//
//  Created by Mac on 20.02.25.
//

import Foundation

class LoginViewModel {
    let authManager = AuthManager()
    
    func config(email: String, password: String) {
        if !email.isEmpty && !password.isEmpty {
            authManager.authenticateUser(email: email,
                                         password: password) { message in
                print(message ?? "")
            }
        }
    }
}
