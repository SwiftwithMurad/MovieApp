//
//  Actor.swift
//  MovieApp
//
//  Created by Mac on 06.02.25.
//

import Foundation

// MARK: - Actor
struct Actor: Codable {
    let page: Int?
    let results: [Result]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Result: Codable, ImageLabelProtocol {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment: KnownForDepartment?
    let name, originalName: String?
    let popularity: Double?
    let profilePath: String?
    let knownFor: [KnownFor]?
    
    var titleText: String {
        name ?? ""
    }
    
    var imageURL: String {
        profilePath ?? ""
    }
    
    var overviewText: String {
        ""
    }

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case knownFor = "known_for"
    }
}

// MARK: - KnownFor
struct KnownFor: Codable, ActorDetails {
    let backdropPath: String?
    let id: Int?
    let title, originalTitle, overview, posterPath: String?
    let mediaType: MediaType?
    let adult: Bool?
    let originalLanguage: String?
    let genreIDS: [Int]?
    let popularity: Double?
    let releaseDate: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    let name, originalName, firstAirDate: String?
    let originCountry: [String]?
    
    var image: String {
        posterPath ?? ""
    }
    
    var movieName: String {
        title ?? ""
    }
    
    var rating: Double {
        voteAverage ?? 0
    }
    
    var overviewText: String {
        overview ?? ""
    }

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id, title
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case mediaType = "media_type"
        case adult
        case originalLanguage = "original_language"
        case genreIDS = "genre_ids"
        case popularity
        case releaseDate = "release_date"
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
    case tv = "tv"
}

enum KnownForDepartment: String, Codable {
    case acting = "Acting"
}
