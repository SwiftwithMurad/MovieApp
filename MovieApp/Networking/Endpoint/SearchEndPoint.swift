//
//  SearchEndPoint.swift
//  MovieApp
//
//  Created by Mac on 08.02.25.
//

import Foundation

enum SearchEndPoint {
    case movie(name: String, page: Int)
    
    var path: String {
        switch self {
        case .movie(name: let name, page: let page):
            return NetworkHelper.shared.configURL(with: "search/movie?query=\(name)&page=\(page)")
        }
    }
}
