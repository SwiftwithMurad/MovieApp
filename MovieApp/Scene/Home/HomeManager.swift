//
//  HomeManager.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

class HomeManager {
    let manager = NetworkManager()
    
    func getMovies(endPoint: String, completion: @escaping ((MovieResult?, String?) -> Void)) {
        manager.getAPIRequest(path: endPoint, model: MovieResult.self, completion: completion)
    }
}
