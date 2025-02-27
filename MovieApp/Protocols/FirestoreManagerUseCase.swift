//
//  FirestoreManagerUseCase.swift
//  MovieApp
//
//  Created by Mac on 25.02.25.
//

import Foundation

protocol FirestoreManagerUseCase {
    func saveMovie(movie: MovieDetail, completion: @escaping ((String?) -> Void))
    func getMovies(count: Int, completion: @escaping ((FavoritesModel?, String?) -> Void))
    func getDocument(completion: @escaping ((FavoritesModel?, String?) -> Void))
}
