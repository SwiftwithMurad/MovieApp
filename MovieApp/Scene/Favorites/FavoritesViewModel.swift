//
//  FavoritesViewModel.swift
//  MovieApp
//
//  Created by Mac on 21.02.25.
//

import Foundation

class FavoritesViewModel {
    let fireStoreManager = FirestoreManager()
    var movieDetail = [FavoritesModel]()
    var errorHandling: ((String) -> Void)?
    var success: (() -> Void)?
    
    func getDocument() {
        fireStoreManager.getDocument { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
            } else if let data {
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: data)
                    let decoder = JSONDecoder()
                    decoder.keyDecodingStrategy = .convertFromSnakeCase
                    let movie = try decoder.decode(FavoritesModel.self, from: jsonData)
                    movieDetail.append(movie)
                    print("Movies: \(movieDetail)")
                    success?()
                } catch {
                    errorHandling?(error.localizedDescription)
                }
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
