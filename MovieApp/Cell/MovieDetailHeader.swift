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
        label.numberOfLines = 2
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
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Overview"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewText: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .medium)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
         generalView,
         overviewLabel,
         overviewText].forEach { addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieImage.widthAnchor.constraint(equalToConstant: 300),
            movieImage.heightAnchor.constraint(equalToConstant: 350),
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            //            movieImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 24),
            movieName.leadingAnchor.constraint(equalTo: movieImage.leadingAnchor),
            movieName.trailingAnchor.constraint(equalTo: movieImage.trailingAnchor),
            
            generalView.widthAnchor.constraint(equalToConstant: 300),
            generalView.heightAnchor.constraint(equalToConstant: 24),
            generalView.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 16),
            //            generalView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            //            generalView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            generalView.centerXAnchor.constraint(equalTo: centerXAnchor),
            //            generalView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            countryStack.leadingAnchor.constraint(equalTo: generalView.leadingAnchor, constant: 8),
            countryStack.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 4),
            countryStack.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: 0),
            
            hourStack.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 4),
            hourStack.centerXAnchor.constraint(equalTo: generalView.centerXAnchor),
            hourStack.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: 0),
            
            ratingStack.trailingAnchor.constraint(equalTo: generalView.trailingAnchor, constant: -8),
            ratingStack.topAnchor.constraint(equalTo: generalView.topAnchor, constant: 4),
            ratingStack.bottomAnchor.constraint(equalTo: generalView.bottomAnchor, constant: 0),
            
            countryImage.widthAnchor.constraint(equalToConstant: 20),
            countryImage.heightAnchor.constraint(equalToConstant: 20),
            hourImage.widthAnchor.constraint(equalToConstant: 20),
            hourImage.heightAnchor.constraint(equalToConstant: 20),
            starImage.widthAnchor.constraint(equalToConstant: 20),
            starImage.heightAnchor.constraint(equalToConstant: 20),
            
            overviewLabel.topAnchor.constraint(equalTo: generalView.bottomAnchor, constant: 16),
            overviewLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            overviewText.topAnchor.constraint(equalTo: overviewLabel.bottomAnchor, constant: 8),
            overviewText.leadingAnchor.constraint(equalTo: overviewLabel.leadingAnchor),
            overviewText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            overviewText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
        ])
    }
    
    func config(movie: MovieResult) {
        let imageURL = NetworkHelper.shared.imageURL + (movie.posterPath ?? "")
        movieImage.loadImage(with: imageURL)
        movieName.text = movie.title
        movieCountry.text = movie.originalLanguage?.capitalized
        self.movieHour.text = movie.releaseDate ?? ""
        movieRating.text = "\(String(String(movie.voteAverage ?? 0).prefix(3)))/10"
        overviewText.text = movie.overview ?? ""
        self.movie = movie
    }
    
    func configHeader(movie: ImageLabelProtocol) {
        movieImage.loadImage(with: movie.imageURL)
        movieName.text = movie.titleText
        overviewText.text = movie.overviewText
        movieCountry.text = movie.country
        movieHour.text = movie.hour
        movieRating.text = movie.rating
    }
}
