//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation
import Alamofire

class NetworkHelper {
    static let shared = NetworkHelper()
    
    private let baseURL = "https://api.themoviedb.org/3/"
    let imageURL = "https://image.tmdb.org/t/p/original"
    let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhNWY1MTMwZTg0ZDk0ZDgyOGE3MmE2NmI0YWI0OWI1MSIsIm5iZiI6MTczODM0NzU1NS43NTMsInN1YiI6IjY3OWQxNDIzYTc0ZDhlZTIzYjI2MGNkOSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.P94ST_KwzN_mMnvwY-7wNkLa5Z6QNkPm5xFbM43haKs"]
    
    func configURL(with url: String) -> String {
        return baseURL + url
    }
}
