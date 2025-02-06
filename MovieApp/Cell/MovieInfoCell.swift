//
//  MovieInfoCell.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import UIKit

class MovieInfoCell: UICollectionViewCell {
    var movie = [MovieInfoModel]()
    
    private let movieInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
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
        contentView.addSubview(movieInfoLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            movieInfoLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            movieInfoLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
    
    func configCell(info: MovieInfoModel) {
        movieInfoLabel.text = info.title
    }
}
