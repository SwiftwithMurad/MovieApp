//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class HomeViewModel {
    let movieManager = MovieManager()
    var movie: Movie?
    var home = [HomeModel]()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getAllMovies() {
        for name in MovieEndpoint.allCases {
//            movieManager.getAllMovies(name: name) { [weak self] data, error in
//                guard let self = self else { return }
//                print(movie?.page ?? 0)
//                if let error {
//                    errorHandling?(error)
//                } else if let data {
//                    movie = data
//                    home.append(.init(title: name.rawValue, items: data.results ?? []))
//                    success?()
//                }
//            }
            movieManager.getSeeAllMovies(name: name, page: 1) { [weak self] data, error in
                guard let self = self else { return }
                if let error {
                    errorHandling?(error)
                } else if let data {
                    movie = data
                    home.append(.init(title: name.rawValue, items: data.results ?? []))
                    success?()
                }
            }
        }
    }
    
    func paginate(page: Int) {
        if page == home.count - 1 && (movie?.page ?? 0 < movie?.totalPages ?? 0) {
            getAllMovies()
        }
    }
    
    func refreshPage() {
        movie = nil
        home.removeAll()
        getAllMovies()
    }
}
