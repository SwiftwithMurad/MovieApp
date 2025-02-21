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
    func handle(email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void))
    func createUser(email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void))
    func signIn(email: String, password: String, completion: @escaping ((AuthDataResult?, Error?) -> Void))
}
