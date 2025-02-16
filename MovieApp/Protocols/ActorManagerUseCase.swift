//
//  ActorManagerProtocol.swift
//  MovieApp
//
//  Created by Mac on 08.02.25.
//

import Foundation

protocol ActorManagerUseCase {
    func getActors(page: Int, completion: @escaping ((Actor?, String?) -> Void))
    func getActorMovies(actorId: Int, completion: @escaping ((ActorMovies?, String?) -> Void))
    func getMovies(movieId: Int, completion: @escaping ((ActorMovies?, String?) -> Void))
}
