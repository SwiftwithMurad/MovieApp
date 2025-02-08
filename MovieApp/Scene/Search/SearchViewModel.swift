//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import Foundation

class SearchViewModel {
    var movie = [MovieResult]()
    var allMovies = [MovieResult]()
    var success: (() -> Void)?
    var errorHandling: (() -> Void)?
    
    func getAllMovies() {
//        manager.getAPIRequest(path: <#T##String#>, model: <#T##T#>, completion: <#T##(T?, String?) -> Void#>)
    }
}
