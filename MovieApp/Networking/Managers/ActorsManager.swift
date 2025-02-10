//
//  ActorManager.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

class ActorsManager: ActorManagerUseCase {
    let manager = NetworkManager()
    
    func getActors(completion: @escaping ((Actor?, String?) -> Void)) {
        let path = ActorEndpoint.actor.path
        manager.getAPIRequest(path: path, model: Actor.self, completion: completion)
    }
    
    func getActorMovies(actorId: Int, completion: @escaping ((ActorMovies?, String?) -> Void)) {
        let path = ActorEndpoint.actorMovies(id: actorId).path
        manager.getAPIRequest(path: path, model: ActorMovies.self, completion: completion)
    }
    
    func getMovies(movieId: Int, completion: @escaping ((ActorMovies?, String?) -> Void)) {
        let path = ActorEndpoint.actorMovieDetail(id: movieId).path
        manager.getAPIRequest(path: path, model: ActorMovies.self, completion: completion)
    }
}
