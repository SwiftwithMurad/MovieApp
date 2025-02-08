//
//  ActorsViewModel.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import Foundation

class ActorsViewModel {
    var actor = [Result]()
    var allActors = [Result]()
    let actorManager = ActorsManager()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getActors() {
        actorManager.getActors { [weak self] data, errorMessage in
            guard let self = self else { return }
            if let errorMessage {
                errorHandling?(errorMessage)
            } else if let data {
                actor = data.results ?? []
                allActors = data.results ?? []
                success?()
            }
        }
    }
}
