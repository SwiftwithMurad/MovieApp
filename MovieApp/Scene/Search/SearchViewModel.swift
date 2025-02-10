//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class SearchViewModel {
    var movie = [MovieResult]()
    var allMovies = [MovieResult]()
    var searchManager = SearchManager()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getAllMovies(name: String) {
        searchManager.getSearchMovies(value: name) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                movie = data.results ?? []
                success?()
            }
            
        }
    }
}
