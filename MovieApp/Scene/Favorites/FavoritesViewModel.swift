//
//  FavoritesViewModel.swift
//  MovieApp
//
//  Created by Mac on 21.02.25.
//

import Foundation

class FavoritesViewModel {
    private let fireStoreManager = FirestoreManager()
    var movieDetail = [FavoritesModel]()
    var errorHandling: ((String) -> Void)?
    var success: (() -> Void)?
    
    func getDocument() {
        fireStoreManager.getDocument { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                movieDetail.append(data)
                print("Movies: \(movieDetail)")
                success?()
            }
        }
    }
    
    func reset() {
        movieDetail.removeAll()
        getDocument()
    }
    
    func deleteMovie(index: String) {
        fireStoreManager.deleteMovie(movieId: index)
    }
}
