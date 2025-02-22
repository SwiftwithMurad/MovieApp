//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class MovieDetailViewModel {
    var movieModel: MovieDetail?
    private(set) var movie = [MovieResult]()
    let movieManager = MovieManager()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    var id: Int?

    func getMovieDetail() {
        movieManager.getMovieDetail(id: id ?? 1) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                movieModel = data
                success?()
            }
        }
    }
    
    func getSimilarMovies() {
        movieManager.getSimilarMovies(id: id ?? 1) { [weak self] data, error in
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
