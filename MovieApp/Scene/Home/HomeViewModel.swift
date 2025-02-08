//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class HomeViewModel {
    let manager = NetworkManager()
    let homeManager = HomeManager()
    var home = [HomeModel]()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getAllData() {
        getPopular()
        getTopRated()
        getNowPlaying()
        getUpcoming()
    }

    func getPopular() {
        let path = MovieEndpoint.popular.path
        manager.getAPIRequest(path: path, model: Movie.self) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                home.append(.init(title: "Popular", items: data.results ?? []))
                success?()
            }
        }
    }
    
    func getTopRated() {
        let path = MovieEndpoint.topRated.path
        manager.getAPIRequest(path: path, model: Movie.self) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                home.append(.init(title: "Top Rated", items: data.results ?? []))
                success?()
            }
        }
    }
    
    func getNowPlaying() {
        let path = MovieEndpoint.nowPlaying.path
        manager.getAPIRequest(path: path, model: Movie.self) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                home.append(.init(title: "Now Playing", items: data.results ?? []))
                success?()
            }
        }
    }
    
    func getUpcoming() {
        let path = MovieEndpoint.upcoming.path
        manager.getAPIRequest(path: path, model: Movie.self) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                home.append(.init(title: "Upcoming", items: data.results ?? []))
                success?()
            }
        }
    }
    
//    func getManager() {
//        homeManager.getMovies(endPoint: <#MovieEndpoint#>) { [weak self] data, errorMessage in
//            guard let self = self else { return }
//            if let errorMessage {
//                errorHandling?(errorMessage)
//            } else if let data {
//                home = data
//                success?()
//            }
//        }
//    }
}
