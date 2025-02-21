//
//  AuthManager.swift
//  MovieApp
//
//  Created by Mac on 20.02.25.
//

import Foundation
import FirebaseAuth

class AuthManager: AuthManagerUseCase {
    func authenticateUser(email: String, password: String, completion: @escaping ((String?) -> Void)) {
        handle(email: email, password: password) { _, error in
            if let error {
                completion(error.localizedDescription)
            }
        }
    }
    
    func handle(email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        if Auth.auth().currentUser == nil {
            createUser(email: email, password: password, completion: completion)
        } else {
            signIn(email: email, password: password, completion: completion)
        }
    }
    
    func createUser(email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        Auth.auth().createUser(withEmail: email, password: password, completion: completion)
    }
    
    func signIn(email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void)) {
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
}

