//
//  ActorDetails.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

protocol ActorDetails {
    var image: String { get }
    var movieName: String { get }
    var rating: Double { get }
    var overviewText: String { get }
}
