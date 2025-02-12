//
//  MovieEndpoint.swift
//  MovieApp
//
//  Created by Mac on 06.02.25.
//

import Foundation

enum MovieEndpoint: String {
    case nowPlaying = "movie/now_playing"
    case popular = "movie/popular"
    case topRated = "movie/top_rated"
    case upcoming = "movie/upcoming"
    case similar = "/similar"
    
    var path: String {
        NetworkHelper.shared.configURL(with: self.rawValue)
    }
    
//    var hey: String {
//        for endpoint in self.rawValue {
//            switch self.rawValue {
//            case endpoint:
//                NetworkHelper.shared.configURL(with: endpoint)
//            }
//        }
//    }
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
