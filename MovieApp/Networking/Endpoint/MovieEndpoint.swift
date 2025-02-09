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
}
