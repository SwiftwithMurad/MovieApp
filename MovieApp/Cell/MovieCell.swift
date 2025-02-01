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
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var movieName: UILabel = {
        let label = UILabel()
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
        [movieImage, movieName].forEach { addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieImage.widthAnchor.constraint(equalToConstant: 168),
            movieImage.heightAnchor.constraint(equalToConstant: 240),
            movieImage.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            movieImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            movieImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            
            movieName.topAnchor.constraint(equalTo: movieImage.bottomAnchor, constant: 8),
            movieName.centerYAnchor.constraint(equalTo: movieImage.centerYAnchor)
        ])
    }
    
    func configCell(name: String, imageURL: String, data: [MovieResult]) {
        movieName.text = name
        
        self.data = data
    }
}
