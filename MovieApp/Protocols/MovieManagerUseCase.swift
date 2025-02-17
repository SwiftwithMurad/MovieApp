//
//  MovieManagerUseCase.swift
//  MovieApp
//
//  Created by Mac on 09.02.25.
//

import Foundation

protocol MovieManagerUseCase {
    func getAllMovies(name: MovieEndpoint, page: Int, completion: @escaping ((Movie?, String?) -> Void))
    func getSimilarMovies(id: Int, completion: @escaping ((Movie?, String?) -> Void))
}
