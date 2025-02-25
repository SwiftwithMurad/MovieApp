//
//  TrailerEndpoint.swift
//  MovieApp
//
//  Created by Mac on 23.02.25.
//

import Foundation

enum TrailerEndpoint {
    case trailer(id: Int)
    
    var path: String {
        switch self {
        case .trailer(let id):
            NetworkHelper.shared.configURL(with: "movie/\(id)/videos")
        }
    }
}
