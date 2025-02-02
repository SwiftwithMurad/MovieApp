//
//  MovieCell.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {
    private var data = [MovieResult]()
    
    private lazy var movieImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var movieName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
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
        [movieImage, movieName].forEach { addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieImage.heightAnchor.constraint(equalToConstant: 220),
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8),
            movieName.leadingAnchor.constraint(equalTo: movieImage.leadingAnchor, constant: 8),
            movieName.trailingAnchor.constraint(equalTo: movieImage.trailingAnchor, constant: -8),
        ])
    }
    
    func configCell(name: String, imageURL: String, data: [MovieResult]) {
        movieName.text = name
        guard let imageURL = URL(string: "\(NetworkHelper.imageURL)/\(imageURL)") else { return }
        movieImage.kf.setImage(with: imageURL,
                               placeholder: UIImage(named: "placeholder"))
        self.data = data
    }
}
