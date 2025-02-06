//
//  ActorEndpoint.swift
//  MovieApp
//
//  Created by Mac on 06.02.25.
//

import Foundation
 
enum ActorEndpoint: String {
    case actor = "person/popular"
    
    var path: String {
        NetworkHelper.shared.configURL(with: self.rawValue)
    }
}
