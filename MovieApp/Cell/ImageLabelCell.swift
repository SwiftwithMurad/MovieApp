//
//  MovieCell.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import UIKit

class ImageLabelCell: UICollectionViewCell {
    private lazy var cellImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 16
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var cellName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
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
        [cellImage,
         cellName].forEach { contentView.addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            cellImage.heightAnchor.constraint(equalToConstant: 220),
            cellImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            cellImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            cellName.topAnchor.constraint(equalTo: cellImage.bottomAnchor, constant: 8),
            cellName.leadingAnchor.constraint(equalTo: cellImage.leadingAnchor),
            cellName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
    }
    
    func config(data: ImageLabelProtocol) {
        cellName.text = data.titleText
        cellImage.loadImage(with: data.imageURL)
    }
}
