//
//  FireStoreModel.swift
//  MovieApp
//
//  Created by Mac on 25.02.25.
//

import Foundation

struct FavoritesModel: Codable, ActorDetails {
    let id: Int?
    let name: String?
    let poster: String?
    let rating: Double?
    let overview: String?
    
    var image: String {
        poster ?? ""
    }
    
    var movieName: String {
        name ?? ""
    }
    
    var ratingData: Double {
        rating ?? 1
    }
    
    var overviewText: String {
        overview ?? ""
    }
}
