//
//  MovieInfoModel.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import Foundation

struct MovieInfoModel: ImageLabelProtocol {
    let title: String?
    let image: String?
    let overview: String?
    let movie: [MovieResult]?
    
    var titleText: String {
        title ?? ""
    }
     
    var imageURL: String {
        image ?? ""
    }
    
    var overviewText: String {
        overview ?? ""
    }
}
