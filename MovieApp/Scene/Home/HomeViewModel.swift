//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class HomeViewModel {
    let manager = NetwokManager()
    var home = [HomeModel]()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getAllData() {
        getPopular()
        getTrending()
        getNowPlaying()
        getUpcoming()
    }
    
    func getPopular() {
        manager.getAPIRequest(endPoint: .popular, model: Movie.self) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                home.append(.init(title: "Popular", items: data.results ?? []))
                success?()
            }
        }
    }
    
    func getTrending() {
        manager.getAPIRequest(endPoint: .popular, model: Movie.self) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                home.append(.init(title: "Trending", items: data.results ?? []))
                success?()
            }
        }
    }
    
    func getNowPlaying() {
        manager.getAPIRequest(endPoint: .popular, model: Movie.self) { [weak self] data, error in
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
        manager.getAPIRequest(endPoint: .popular, model: Movie.self) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                home.append(.init(title: "Upcoming", items: data.results ?? []))
                success?()
            }
        }
    }
}
