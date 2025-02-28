//
//  ActorDetailViewModel.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

class ActorDetailViewModel {
    private(set) var knownFor = [Cast]()
    private let actorManager: ActorManagerUseCase
    private var id: Int
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    init(id: Int, actorManager: ActorManagerUseCase) {
        self.id = id
        self.actorManager = actorManager
    }
    
    func getActorMovies() {
        actorManager.getActorMovies(actorId: id) { [weak self] data, errorMessage in
            guard let self = self else { return }
            if let errorMessage {
                errorHandling?(errorMessage)
            } else if let data {
                knownFor = data.cast ?? []
                success?()
            }
        }
    }
}
