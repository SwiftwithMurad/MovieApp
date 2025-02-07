//
//  ActorDetailCell.swift
//  MovieApp
//
//  Created by Mac on 07.02.25.
//

import UIKit

class ActorDetailCell: UITableViewCell {
    private let movieImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let movieName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "star.fill")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let ratingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configUI()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        [movieImage, movieName, starImage, overviewLabel].forEach { contentView.addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            movieImage.widthAnchor.constraint(equalToConstant: 100),
            movieImage.heightAnchor.constraint(equalToConstant: 150),
//            movieImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            movieName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            movieName.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 16),
//            movieName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            
            starImage.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 16),
            starImage.widthAnchor.constraint(equalToConstant: 20),
            starImage.heightAnchor.constraint(equalToConstant: 20),
            starImage.leadingAnchor.constraint(equalTo: movieName.leadingAnchor),
            
//            ratingLabel.topAnchor.constraint(equalTo: starImage.topAnchor),
//            ratingLabel.leadingAnchor.constraint(equalTo: starImage.leadingAnchor, constant: 8),
//            ratingLabel.centerXAnchor.constraint(equalTo: starImage.centerXAnchor),
//            
            overviewLabel.topAnchor.constraint(equalTo: starImage.bottomAnchor, constant: 12),
            overviewLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func config(data: KnownFor) {
        movieImage.loadImage(with: data.posterPath ?? "")
        movieName.text = data.title ?? ""
        ratingLabel.text = "\(String(String(data.voteAverage ?? 0).prefix(3)))/10"
        overviewLabel.text = data.overview ?? ""
    }
}
