//
//  MovieManagerUseCase.swift
//  MovieApp
//
//  Created by Mac on 09.02.25.
//

import Foundation

protocol MovieManagerUseCase {
    func getAllMovies(name: MovieEndpoint, completion: @escaping ((Movie?, String?) -> Void))
    func getSimilarMovies(id: Int, completion: @escaping ((Movie?, String?) -> Void))
    func getSeeAllMovies(name: MovieEndpoint, page: Int, completion: @escaping ((Movie?, String?) -> Void))
    func getMovieDetail(id: Int, completion: @escaping ((MovieDetail?, String?) -> Void))
    func getTrailer(id: Int, completion: @escaping ((MovieTrailer?, String?) -> Void))
}
