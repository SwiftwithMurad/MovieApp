//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class MovieDetailViewModel {
    var movie: MovieResult?
    
    func config(movie: MovieResult) {
        self.movie = movie
    }
}
