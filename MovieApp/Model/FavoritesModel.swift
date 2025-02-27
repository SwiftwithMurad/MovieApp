//
//  FireStoreModel.swift
//  MovieApp
//
//  Created by Mac on 25.02.25.
//

import Foundation

struct FavoritesModel: Codable, ActorDetails {
    let id: Int?
    let title: String?
    let poster: String?
    let rate: Double?
    let overview: String?
    
    var image: String {
        poster ?? ""
    }
    
    var movieName: String {
        title ?? ""
    }
    
    var rating: Double {
        rate ?? 1
    }
    
    var overviewText: String {
        overview ?? ""
    }
}
