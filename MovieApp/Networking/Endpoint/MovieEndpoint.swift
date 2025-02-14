//
//  MovieEndpoint.swift
//  MovieApp
//
//  Created by Mac on 06.02.25.
//

import Foundation

enum MovieEndpoint: String, CaseIterable {
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    case similar = "movie/similar"
    
    var path: String {
        NetworkHelper.shared.configURL(with: self.rawValue)
    }
}

enum MovieEndpoint2: String, CaseIterable {
    case nowPlaying = "Now Playing"
    case popular = "Popular"
    case topRated = "Top Rated"
    case upcoming = "UpComing"
    case similar = "Similar"
    
    var path: String {
        switch self {
        case .nowPlaying:
            return NetworkHelper.shared.configURL(with: "movie/now_playing")
        case .popular:
            return NetworkHelper.shared.configURL(with: "movie/popular")
        case .topRated:
            return NetworkHelper.shared.configURL(with: "movie/top_rated")
        case .upcoming:
            return NetworkHelper.shared.configURL(with: "movie/upcoming")
        case .similar:
            return NetworkHelper.shared.configURL(with: "movie/similar")
        }
    }
}

enum Moviepoint {
    case allMovies(name: String)
    
    var path: String {
        switch self {
        case .allMovies(name: let name):
            NetworkHelper.shared.configURL(with: "movie/\(name)")
        }
    }
}
