//
//  People.swift
//  MovieApp
//
//  Created by Shamkhal Guliyev on 22.10.22.
//

import Foundation

// MARK: - People
struct Actor: Codable {
    let page: Int?
    let result: [Result]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page
        case result = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - PeopleResult
struct Result: Codable, ImageLabelProtocol {
    let adult: Bool?
    let gender, id: Int?
    let knownFor: [KnownFor]?
    let knownForDepartment, name: String?
    let popularity: Double?
    let profilePath: String?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownFor = "known_for"
        case knownForDepartment = "known_for_department"
        case name, popularity
        case profilePath = "profile_path"
        case status
    }
    
    var titleText: String {
        name ?? ""
    }

    var imageURL: String {
        profilePath ?? ""
    }

    var movieName: String {
        name ?? ""
    }

    var overviewText: String {
        ""
    }

    var country: String {
        ""
    }

    var hour: String {
        ""
    }

    var rating: String {
        ""
    }
}

// MARK: - PeopleKnownFor
struct KnownFor: Codable, ActorDetails {
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let mediaType, originalLanguage, originalTitle, overview: String?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?
    
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
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case mediaType = "media_type"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
