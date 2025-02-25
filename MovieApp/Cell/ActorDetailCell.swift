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
        label.numberOfLines = 2
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
        label.numberOfLines = 3
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
        [movieImage,
         movieName,
         starImage,
         ratingLabel,
         overviewLabel].forEach { contentView.addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            movieImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            movieImage.widthAnchor.constraint(equalToConstant: 150),
            movieImage.heightAnchor.constraint(equalToConstant: 200),
            
            movieName.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            movieName.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 16),
            movieName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            
            starImage.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 24),
            starImage.widthAnchor.constraint(equalToConstant: 28),
            starImage.heightAnchor.constraint(equalToConstant: 28),
            starImage.leadingAnchor.constraint(equalTo: movieName.leadingAnchor),
            
            ratingLabel.topAnchor.constraint(equalTo: movieName.bottomAnchor, constant: 28),
            ratingLabel.leadingAnchor.constraint(equalTo: starImage.trailingAnchor, constant: 4),

            overviewLabel.leadingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20)
        ])
    }
    
    func config(data: ActorDetails) {
        movieImage.loadImage(with: data.image)
        movieName.text = data.movieName
        ratingLabel.text = "\(String(String(data.rating).prefix(3)))/10"
        overviewLabel.text = data.overviewText
    }
}
