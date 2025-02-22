//
//  MovieCellProtocol.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import Foundation

protocol ImageLabelProtocol {
    var titleText: String { get }
    var imageURL: String { get }
    var overviewText: String { get }
    var country: String { get }
    var hour: Int { get }
    var rating: String { get }
    var movieName: String { get }
    var backdrop: String { get }
}
