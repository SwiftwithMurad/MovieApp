//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class SearchViewModel {
    private(set) var movieModel: Movie?
    var movie = [MovieResult]()
    private(set) var allMovies = [MovieResult]()
    var searchManager = SearchManager()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getAllMovies(name: String) {
        print(movieModel?.page ?? 0)
        searchManager.getSearchMovies(value: name, page: (movieModel?.page ?? 0) + 1) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                movieModel = data
                allMovies = data.results ?? []
                movie.append(contentsOf: data.results ?? [])
                success?()
            }
        }
    }
    
    func paginate(page: Int, name: String) {
        if page == movie.count - 2 && (movieModel?.page ?? 0 <= movieModel?.totalPages ?? 0) {
            getAllMovies(name: name)
        }
    }
    
    func resetMovies() {
        movieModel = nil
        movie.removeAll()
    }
}
