//
//  MovieCell.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import UIKit

class ImageLabelCell: UICollectionViewCell {
    private var data = [MovieResult]()
    
    private lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
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
        [movieImage,
         movieName].forEach { contentView.addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieImage.heightAnchor.constraint(equalToConstant: 220),
            movieImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            movieImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8),
            movieName.leadingAnchor.constraint(equalTo: movieImage.leadingAnchor),
            movieName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -4),
        ])
    }
    
    func config(data: MovieCellProtocol) {
        movieName.text = data.titleText
        movieImage.loadImage(with: data.imageURL)
    }
}
