//
//  ActorDetailViewModel.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import Foundation

class ActorDetailViewModel {
    var knownFor = [KnownFor]()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
}
