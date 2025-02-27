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
                         page: Int,
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
    
    func getMovieDetail(id: Int, completion: @escaping ((MovieDetail?, String?) -> Void)) {
        let path = NetworkHelper.shared.configURL(with: "movie/\(id)")
        manager.getAPIRequest(path: path, model: MovieDetail.self, completion: completion)
    }
    
    func getTrailer(id: Int, completion: @escaping ((MovieTrailer?, String?) -> Void)) {
        let path = TrailerEndpoint.trailer(id: id).path
        manager.getAPIRequest(path: path, model: MovieTrailer.self, completion: completion)
    }
}
