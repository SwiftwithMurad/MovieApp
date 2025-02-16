//
//  HomeManager.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

class MovieManager: MovieManagerUseCase {
    let manager = NetworkManager()
    
    func getAllMovies(name: MovieEndpoint2, completion: @escaping ((Movie?, String?) -> Void)) {
        var path = ""
        switch name {
        case .nowPlaying:
            path = MovieEndpoint2.nowPlaying.path
        case .popular:
            path = MovieEndpoint2.popular.path
        case .topRated:
            path = MovieEndpoint2.topRated.path
        case .upcoming:
            path = MovieEndpoint2.upcoming.path
        }
        manager.getAPIRequest(path: path, model: Movie.self, completion: completion)
    }

    func getSimilarMovies(id: Int, completion: @escaping ((Movie?, String?) -> Void)) {
        let path = NetworkHelper.shared.configURL(with: "movie/\(id)\(MovieEndpoint.similar.rawValue)")
        manager.getAPIRequest(path: path, model: Movie.self, completion: completion)
    }
}
