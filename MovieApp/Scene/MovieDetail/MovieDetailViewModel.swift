//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class MovieDetailViewModel {
    private(set) var movieModel: MovieDetail?
    private(set) var movie = [MovieResult]()
    private(set) var trailer = [TrailerResult]()
    private var id: Int?
    private let movieManager = MovieManager()
    let fireStoreManager = FirestoreManager()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    init(id: Int) {
        self.id = id
    }

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
    
    func addDataToFireStore() {
        guard let movieDetail = movieModel else { return }
        fireStoreManager.saveMovie(movie: movieDetail) { [weak self] message in
            guard let self = self else { return }
            if let message {
                errorHandling?(message)
            } else {
                print("Success")
            }
        }
    }
    
    func showTrailer() {
        movieManager.getTrailer(id: id ?? 1) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                trailer = data.results ?? []
                success?()
            }
        }
    }
}
