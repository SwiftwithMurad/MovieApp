//
//  MovieDetailHeader.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import UIKit

class MovieDetailHeader: UICollectionReusableView {
    var movie: MovieResult?
    
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
        stack.distribution = .equalSpacing
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
        stack.distribution = .equalSpacing
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
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
         generalView].forEach { addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieImage.widthAnchor.constraint(equalToConstant: 300),
            movieImage.heightAnchor.constraint(equalToConstant: 350),
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 24),
            movieName.leadingAnchor.constraint(equalTo: movieImage.leadingAnchor),
            
            generalView.widthAnchor.constraint(equalToConstant: 192),
            generalView.heightAnchor.constraint(equalToConstant: 24),
            generalView.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 16),
            generalView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            generalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            
            countryStack.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 8),
            countryStack.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 8),
            
            hourStack.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 8),
            hourStack.centerXAnchor.constraint(equalTo: generalView.centerXAnchor),
            
            ratingStack.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -8),
            ratingStack.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 8),
            
            countryImage.widthAnchor.constraint(equalToConstant: 20),
            countryImage.heightAnchor.constraint(equalToConstant: 20),
            hourImage.widthAnchor.constraint(equalToConstant: 20),
            hourImage.heightAnchor.constraint(equalToConstant: 20),
            starImage.widthAnchor.constraint(equalToConstant: 20),
            starImage.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func config(movie: MovieResult) {
        guard let imageURL = URL(string: "\(NetworkHelper.shared.imageURL)/\(movie.posterPath ?? "")") else { return }
        movieImage.kf.setImage(with: imageURL,
                               placeholder: UIImage(named: "placeholder"))
        movieName.text = movie.title
        movieCountry.text = movie.originalLanguage?.capitalized
        self.movieHour.text = movie.releaseDate ?? ""
        movieRating.text = "\(String(String(movie.voteAverage ?? 0).prefix(3)))/10"
        self.movie = movie
    }}
