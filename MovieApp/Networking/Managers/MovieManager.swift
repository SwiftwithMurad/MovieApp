//
//  HomeManager.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

class MovieManager: MovieManagerUseCase {
    let manager = NetworkManager()
    
    func getMovies(endPoint: String, completion: @escaping ((MovieResult?, String?) -> Void)) {
        manager.getAPIRequest(path: endPoint, model: MovieResult.self, completion: completion)
    }
    
    func getSimilarMovies(id: Int, completion: @escaping ((Movie?, String?) -> Void)) {
        let path = NetworkHelper.shared.configURL(with: "movie/\(id)\(MovieEndpoint.similar.rawValue)")
        manager.getAPIRequest(path: path, model: Movie.self, completion: completion)
    }
}
