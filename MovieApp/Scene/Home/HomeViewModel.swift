//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation
import UIKit

class HomeViewModel {
    let manager = NetworkManager()
    let homeManager = MovieManager()
    var movie: Movie?
    var home = [HomeModel]()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getAllMovies() {
        for name in MovieEndpoint.allCases {
            homeManager.getAllMovies(name: name, page: (movie?.page ?? 0) + 1) { [weak self] data, error in
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
        home.removeAll()
        getAllMovies()
    }
}
