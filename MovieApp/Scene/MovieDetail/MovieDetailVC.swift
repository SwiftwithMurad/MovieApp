//
//  MovieDetailVC.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import UIKit
import Kingfisher

class MovieDetailVC: UIViewController {
    let viewModel = MovieDetailViewModel()

    private let movieImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let movieName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configConstraints()
    }
    
    private func configUI() {
        view.backgroundColor = .white
        [movieImage,
         movieName].forEach { view.addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieImage.widthAnchor.constraint(equalToConstant: 300),
            movieImage.heightAnchor.constraint(equalToConstant: 350),
            movieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            movieImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            movieImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 24),
            movieName.leadingAnchor.constraint(equalTo: movieImage.leadingAnchor)
        ])
    }
    
    func config(imageURL: String, name: String, movie: MovieResult) {
        guard let imageURL = URL(string: "\(NetworkHelper.imageURL)/\(imageURL)") else { return }
        movieImage.kf.setImage(with: imageURL,
                               placeholder: UIImage(named: "placeholder"))
        movieName.text = name
        viewModel.movie = movie
    }
}
