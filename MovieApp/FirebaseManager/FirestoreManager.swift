//
//  FirestoreManager.swift
//  MovieApp
//
//  Created by Mac on 21.02.25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

class FirestoreManager {
    let db = Firestore.firestore()
    
    func saveMovie(movie: MovieResult, completion: @escaping ((String?) -> Void)) {
        let data: [String: Any] = [
            "movieId": movie.id ?? 0,
            "name": movie.title ?? 0,
            "poster": movie.posterPath ?? ""]
        guard let collection = UserDefaults.standard.value(forKey: "userId") as? String else { return }
        db.collection(collection).document("Favorites").setData(data)
    }
}
