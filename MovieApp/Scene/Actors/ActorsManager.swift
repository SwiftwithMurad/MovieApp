//
//  ActorManager.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

class ActorsManager: ActorManagerProtocol {
    let manager = NetworkManager()
    
    func getActors(completion: @escaping ((Actor?, String?) -> Void)) {
        let path = ActorEndpoint.actor.path
        manager.getAPIRequest(path: path, model: Actor.self, completion: completion)
    }
    
    func getActorMovies(actorId: Int, completion: @escaping (([Cast]?, String?) -> Void)) {
        let path = ActorEndpoint.actorMovies(id: actorId).path
        manager.getAPIRequest(path: path, model: [Cast].self, completion: completion)
    }
}
