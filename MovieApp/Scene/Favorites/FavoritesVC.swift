//
//  FavoritesVC.swift
//  MovieApp
//
//  Created by Mac on 21.02.25.
//

import UIKit

class FavoritesVC: UIViewController {
    let viewModel = FavoritesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configViewModel()
    }
    
    private func configUI() {
        title = "Favorites"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configViewModel() {
        
    }
}
