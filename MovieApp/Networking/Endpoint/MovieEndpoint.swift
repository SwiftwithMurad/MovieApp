//
//  MovieEndpoint.swift
//  MovieApp
//
//  Created by Mac on 06.02.25.
//

import Foundation

enum MovieEndpoint: String, CaseIterable {
    case nowPlaying = "Now Playing"
    case popular = "Popular"
    case topRated = "Top Rated"
    case upcoming = "UpComing" 
    
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
        }
    }
}
