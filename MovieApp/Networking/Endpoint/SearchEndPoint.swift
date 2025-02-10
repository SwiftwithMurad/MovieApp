//
//  SearchEndPoint.swift
//  MovieApp
//
//  Created by Mac on 08.02.25.
//

import Foundation

enum SearchEndPoint {
    case movie(name: String)
    
    var path: String {
        switch self {
        case .movie(name: let name):
            return NetworkHelper.shared.configURL(with: "search/movie?query=\(name)")
        }
    }
}
