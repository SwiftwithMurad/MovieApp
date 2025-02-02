//
//  MovieDetailVC.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import UIKit

class MovieDetailVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    private func configUI() {
        view.backgroundColor = .white
        title = "Movie Detail"
    }
}
