//
//  HomeManager.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

class MovieManager: MovieManagerUseCase {
    let manager = NetworkManager()
    
    func getAllMovies(name: MovieEndpoint,
                      completion: @escaping ((Movie?, String?) -> Void)) {
        var path = ""
        switch name {
        case .nowPlaying:
            path = MovieEndpoint.nowPlaying.path
        case .popular:
            path = MovieEndpoint.popular.path
        case .topRated:
            path = MovieEndpoint.topRated.path
        case .upcoming:
            path = MovieEndpoint.upcoming.path
        }
        manager.getAPIRequest(path: path, model: Movie.self, completion: completion)
    }
    
    func getSeeAllMovies(name: MovieEndpoint, page: Int,
                         completion: @escaping ((Movie?, String?) -> Void)) {
        var path = ""
        switch name {
        case .nowPlaying:
            path = "\(MovieEndpoint.nowPlaying.path)?page=\(page)"
        case .popular:
            path = "\(MovieEndpoint.popular.path)?page=\(page)"
        case .topRated:
            path = "\(MovieEndpoint.topRated.path)?page=\(page)"
        case .upcoming:
            path = "\(MovieEndpoint.upcoming.path)?page=\(page)"
        }
        manager.getAPIRequest(path: path, model: Movie.self, completion: completion)
    }
    
    func getSimilarMovies(id: Int,
                          completion: @escaping ((Movie?, String?) -> Void)) {
        let path = NetworkHelper.shared.configURL(with: "movie/\(id)/\(SimilarMoviesEndpoint.similar)")
        manager.getAPIRequest(path: path, model: Movie.self, completion: completion)
    }
}
