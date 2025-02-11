//
//  Movie.swift
//  MovieApp
//
//  Created by Mac on 10.02.25.
//

import Foundation

extension MovieResult {
    init(movie: Cast) {
        self.posterPath = movie.posterPath
        self.originalLanguage = movie.originalLanguage
        self.voteAverage = movie.voteAverage
        self.title = movie.title
        self.releaseDate = movie.releaseDate
    }
}
