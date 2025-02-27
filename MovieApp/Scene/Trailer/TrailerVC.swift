//
//  TrailerVC.swift
//  MovieApp
//
//  Created by Mac on 25.02.25.
//

import UIKit
import YouTubeiOSPlayerHelper

class TrailerVC: UIViewController {
    let viewModel: TrailerViewModel
    
    private let movieTrailer: YTPlayerView = {
        let trailer = YTPlayerView()
        trailer.contentMode = .scaleAspectFit
        trailer.translatesAutoresizingMaskIntoConstraints = false
        return trailer
    }()
    
    init(viewModel: TrailerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configUI()
        configConstraints()
    }
    
    private func configUI() {
        view.backgroundColor = .white
        view.addSubview(movieTrailer)
        movieTrailer.load(withVideoId: viewModel.key,
                          playerVars: ["playsinline": 1])
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieTrailer.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            movieTrailer.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            movieTrailer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            movieTrailer.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
}
