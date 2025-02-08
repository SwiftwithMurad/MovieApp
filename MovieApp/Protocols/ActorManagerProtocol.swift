//
//  ActorManagerProtocol.swift
//  MovieApp
//
//  Created by Mac on 08.02.25.
//

import Foundation

protocol ActorManagerProtocol {
    func getActors(completion: @escaping ((Actor?, String?) -> Void))
    func getActorMovies(actorId: Int, completion: @escaping (([Cast]?, String?) -> Void)) 
}
