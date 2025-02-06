//
//  ActorsViewModel.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import Foundation

class ActorsViewModel {
    var actor = [Result]()
    let manager = NetworkManager()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getActors() {
        let path = ActorEndpoint.actor.path
        manager.getAPIRequest(path: path,
                              model: Actor.self) { [weak self] data, errorMessage in
            guard let self = self else { return }
            if let errorMessage {
                errorHandling?(errorMessage)
            } else if let data {
                self.actor = data.results ?? []
                success?()
            }
        }
    }
}
