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
    
    private let generalView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let countryStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let movieCountry: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let countryImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "network")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let hourStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let movieHour: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hourImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "clock")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let ratingStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let movieRating: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
        configConstraints()
    }
    
    private func configUI() {
        view.backgroundColor = .white
        [movieCountry,
         countryImage].forEach { countryStack.addArrangedSubview($0)}
        [movieHour,
         hourImage].forEach { hourStack.addArrangedSubview($0) }
        [movieRating,
         starImage].forEach { ratingStack.addArrangedSubview($0) }
        [countryStack,
         hourStack,
         ratingStack].forEach { generalView.addSubview($0) }
        [movieImage,
         movieName,
         generalView].forEach { view.addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieImage.widthAnchor.constraint(equalToConstant: 300),
            movieImage.heightAnchor.constraint(equalToConstant: 350),
            movieImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            movieImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            movieImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 24),
            movieName.leadingAnchor.constraint(equalTo: movieImage.leadingAnchor),
            
            generalView.widthAnchor.constraint(equalToConstant: 192),
            generalView.heightAnchor.constraint(equalToConstant: 24),
            generalView.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 16),
            generalView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            generalView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            countryStack.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 8),
            countryStack.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 8),
            
            hourStack.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 8),
            hourStack.centerXAnchor.constraint(equalTo: generalView.centerXAnchor),
            
            ratingStack.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -8),
            ratingStack.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 8),
            
            countryImage.widthAnchor.constraint(equalToConstant: 24),
            countryImage.heightAnchor.constraint(equalToConstant: 24),
            hourImage.widthAnchor.constraint(equalToConstant: 24),
            hourImage.heightAnchor.constraint(equalToConstant: 24),
            starImage.widthAnchor.constraint(equalToConstant: 24),
            starImage.heightAnchor.constraint(equalToConstant: 24),
        ])
    }
    
    func config(imageURL: String,
                name: String,
                countryName: String,
                movieHour: String,
                rating: String,
                movie: MovieResult) {
        guard let imageURL = URL(string: "\(NetworkHelper.imageURL)/\(imageURL)") else { return }
        movieImage.kf.setImage(with: imageURL,
                               placeholder: UIImage(named: "placeholder"))
        movieName.text = name
        movieCountry.text = countryName
        self.movieHour.text = movieHour
        movieRating.text = rating
        viewModel.movie = movie
    }
}
