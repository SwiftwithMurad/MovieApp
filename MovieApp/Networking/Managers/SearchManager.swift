//
//  SearchManager].swift
//  MovieApp
//
//  Created by Mac on 08.02.25.
//

import Foundation

class SearchManager: SearchManagerUseCase {
    let manager = NetworkManager()
    
    func getSearchMovies(value: String, page: Int, completion: @escaping ((Movie?, String?) -> Void)) {
        let path = SearchEndPoint.movie(name: value, page: page).path
        manager.getAPIRequest(path: path, model: Movie.self, completion: completion)
    }
}
