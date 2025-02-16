//
//  ActorEndpoint.swift
//  MovieApp
//
//  Created by Mac on 06.02.25.
//

import Foundation
 
enum ActorEndpoint {
    case actor(page: Int)
    case actorMovies(id: Int)
    case actorMovieDetail(id: Int)
    
    var path: String {
        switch self {
        case .actor(let page):
            NetworkHelper.shared.configURL(with: "person/popular?page=\(page)")
        case .actorMovies(let id):
            NetworkHelper.shared.configURL(with: "person/\(id)/movie_credits")
        case .actorMovieDetail(let id):
            NetworkHelper.shared.configURL(with: "popular/\(id)/movie_details")
        }
    }
}
