//
//  Coordinator.swift
//  MovieApp
//
//  Created by Mac on 28.02.25.
//

import UIKit
import Foundation

protocol Coordinator {
    var navigationController: UINavigationController { get }
    func start() 
}
