//
//  HomeManager.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

class MovieManager: MovieManagerUseCase {
    let manager = NetworkManager()
    
    func getAllMovies(name: String, completion: @escaping ((Movie?, String?) -> Void)) {
        let path = Moviepoint.allMovies(name: name).path
        manager.getAPIRequest(path: path, model: Movie.self, completion: completion)
    }

    func getSimilarMovies(id: Int, completion: @escaping ((Movie?, String?) -> Void)) {
        let path = NetworkHelper.shared.configURL(with: "movie/\(id)\(MovieEndpoint.similar.rawValue)")
        manager.getAPIRequest(path: path, model: Movie.self, completion: completion)
    }
}
