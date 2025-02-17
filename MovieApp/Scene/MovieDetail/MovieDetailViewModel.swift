//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class MovieDetailViewModel {
    var movieModel: MovieResult?
    var movie = [MovieResult]()
    let movieManager = MovieManager()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func config(movie: MovieResult) {
        self.movieModel = movie
    }
    
    func getSimilarMovies() {
        movieManager.getSimilarMovies(id: movieModel?.id ?? 0) { [weak self] data, error in
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
