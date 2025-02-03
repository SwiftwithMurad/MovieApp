//
//  SeeAllViewModel.swift
//  MovieApp
//
//  Created by Mac on 02.02.25.
//

import Foundation

class SeeAllViewModel {
    var movie = [MovieResult]()
    var allMovies = [MovieResult]()
    var success: (() -> Void)?
    
    func getData(movie: [MovieResult]) {
        self.movie = movie
        allMovies = movie
        success?()
    }
}
