//
//  MovieModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

// MARK: - Movie
struct Movie: Codable {
    let dates: Dates?
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Dates
struct Dates: Codable {
    let maximum, minimum: String?
}

// MARK: - Result
struct MovieResult: Codable, ImageLabelProtocol {
    var adult: Bool?
    var backdropPath: String?
    var genreIDS: [Int]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle, overview: String?
    var popularity: Double?
    var posterPath, releaseDate, title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    
    var titleText: String {
        "\(originalTitle ?? "") (\(releaseDate?.prefix(4) ?? ""))"
    }
    
    var movieName: String {
        originalTitle ?? ""
    }
    
    var imageURL: String {
        posterPath ?? ""
    }
    
    var overviewText: String {
        overview ?? ""
    }
    
    var country: String {
        originalLanguage?.capitalized ?? ""
    }
    
    var hour: String {
        releaseDate ?? ""
    }
    
    var rating: String {
        "\(String(String(voteAverage ?? 0).prefix(3)))/10"
    }
    
    var backdrop: String {
        backdropPath ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
