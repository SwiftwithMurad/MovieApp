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
    var home = [HomeModel]()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getAllMovies() {
        for name in MovieEndpoint2.allCases {
            homeManager.getAllMovies(name: name) { [weak self] data, error in
                guard let self = self else { return }
                if let error {
                    errorHandling?(error)
                } else if let data {
                    home.append(.init(title: name.rawValue, items: data.results ?? []))
                    success?()
                }
            }
        }
    }
    
    func refreshPage() {
        home.removeAll()
        getAllMovies()
    }
}
