//
//  AuthManagerUseCase.swift
//  MovieApp
//
//  Created by Mac on 20.02.25.
//

import Foundation
import FirebaseAuth

protocol AuthManagerUseCase {
    func authenticateUser(email: String, password: String, completion: @escaping ((String?) -> Void))
    func createUser(email: String, password: String, completion: @escaping ((String?) -> Void))
    func signIn(email: String, password: String, completion: @escaping ((String?) -> Void))
}
