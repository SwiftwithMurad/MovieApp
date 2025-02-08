//
//  ActorDetailViewModel.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

class ActorDetailViewModel {
    var knownFor = [Cast]()
    let actorManager = ActorsManager()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    var id: Int?
    
    func getActorMovies() {
        actorManager.getActorMovies(actorId: id ?? 0) { [weak self] data, errorMessage in
            guard let self = self else { return }
            if let errorMessage {
                errorHandling?(errorMessage)
            } else if let data {
                knownFor = data
                success?()
            }
        }
    }
}
