//
//  SearchManagerUseCase.swift
//  MovieApp
//
//  Created by Mac on 10.02.25.
//

import Foundation

protocol SearchManagerUseCase {
    func getSearchMovies(value: String, page: Int, completion: @escaping ((Movie?, String?) -> Void))
}
