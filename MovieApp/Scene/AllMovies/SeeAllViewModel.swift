//
//  SeeAllViewModel.swift
//  MovieApp
//
//  Created by Mac on 02.02.25.
//

import Foundation

class SeeAllViewModel {
    var selectedType: String?
    private(set) var movieModel: Movie?
    var movie: [MovieResult]
    var allMovies = [MovieResult]()
    let movieManager = MovieManager()
    var success: (() -> Void)?
    var errorHandler: ((String) -> Void)?
    
    init(movie: [MovieResult]) {
        self.movie = movie
    }
    
    func getSeeAll() {
        switch selectedType {
        case "Now Playing":
            getMovies(endPoint: .nowPlaying)
        case "Top Rated":
            getMovies(endPoint: .topRated)
        case "UpComing":
            getMovies(endPoint: .upcoming)
        case "Popular":
            getMovies(endPoint: .popular)
        default:
            return
        }
    }
    
    func getMovies(endPoint: MovieEndpoint) {
        movieManager.getSeeAllMovies(name: endPoint, page: (movieModel?.page ?? 1) + 1) { [weak self] data, error in
            guard let self = self else { return }
            print(movieModel?.page ?? 0)
            if let error {
                errorHandler?(error)
            } else if let data {
                movieModel = data
                movie.append(contentsOf: data.results ?? [])
                allMovies = data.results ?? []
                success?()
            }
        }
    }
    
    func paginate(page: Int) {
        if page == movie.count - 2 && (movieModel?.page ?? 1 <= movieModel?.totalPages ?? 0) {
            getSeeAll()
        }
    }
    
    func reset() {
        movieModel = nil
        movie.removeAll()
    }
}
