//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class HomeViewModel {
    let manager = NetworkManager()
    let homeManager = MovieManager()
    var home = [HomeModel]()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?    
    let movieEndpoints = ["popular", "top_rated", "now_playing", "upcoming"]
    
    func getAllMovies() {
        for name in movieEndpoints {
            homeManager.getAllMovies(name: name) { [weak self] data, error in
                guard let self = self else { return }
                if let error {
                    errorHandling?(error)
                } else if let data {
                    home.append(.init(title: name, items: data.results ?? []))
                    success?()
                }
            }
        }
    }
}
