//
//  FirestoreManager.swift
//  MovieApp
//
//  Created by Mac on 21.02.25.
//

import Foundation
import FirebaseFirestore
import FirebaseCore

class FirestoreManager: FirestoreManagerUseCase {
    let db = Firestore.firestore()
    func saveMovie(movie: MovieDetail, completion: @escaping ((String?) -> Void)) {
        let data: [String: Any] = [
            "movieId": movie.id ?? 0,
            "name": movie.title ?? 0,
            "poster": movie.posterPath ?? "",
            "rating": movie.voteAverage ?? 0,
            "overview": movie.overviewText]
        guard let collection = UserDefaults.standard.value(forKey: "userId") as? String else { return }
        db.collection(collection).document(movie.imageURL).setData(data) { error in
            if let error {
                completion(error.localizedDescription)
            } else {
                completion(nil)
            }
        }
    }
    
    func getMovies(count: Int, completion: @escaping (([String: Any]?, String?) -> Void)) {
        guard let collection = UserDefaults.standard.value(forKey: "userId") as? String else { return }
        db.collection(collection).getDocuments { snapshot, error in
            if let error {
                completion(nil, error.localizedDescription)
            } else if let snapshot {
                let data = snapshot.documents[count - 1].data()
                completion(data, nil)
            }
        }
    }
    
    func getDocument(completion: @escaping (([String: Any]?, String?) -> Void)) {
        guard let collection = UserDefaults.standard.value(forKey: "userId") as? String else { return }
        db.collection(collection).getDocuments { [weak self] snapshot, error in
            guard let self = self else { return }
            if let error {
                print(error.localizedDescription)
            } else if let snapshot {
                let count = snapshot.documents.count
                if count > 0 {
                    for index in 1...count {
                        getMovies(count: index) { data, error in
                            if let data {
                                completion(data, nil)
                            } else if let error {
                                completion(nil ,error)
                            }
                        }
                    }
                }
            }
        }
    }
}
