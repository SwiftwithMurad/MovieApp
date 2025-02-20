//
//  ActorsViewModel.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import Foundation

class ActorsViewModel {
    var actorModel: Actor?
    var actor = [Result]()
    var allActors = [Result]()
    let actorManager = ActorsManager()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    
    func getActors() {
        print(actorModel?.page ?? 1)
        actorManager.getActors(page: (actorModel?.page ?? 0) + 1) { [weak self] data, errorMessage in
            guard let self = self else { return }
            if let errorMessage {
                errorHandling?(errorMessage)
            } else if let data {
                actorModel = data
                allActors.append(contentsOf: data.result ?? [])
                actor = data.result ?? []
                success?()
            }
        }
    }
    
    func paginate(page: Int) {
        if page == allActors.count - 2 && (actorModel?.page ?? 0 <= actorModel?.totalPages ?? 0) {
            getActors()
        }
    }
    
    func reset() {
        actorModel = nil
        allActors.removeAll()
    }
}
