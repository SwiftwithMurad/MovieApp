//
//  MovieInfoCell.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import UIKit

class MovieInfoCell: UICollectionViewCell {
    var movie = [MovieInfoModel]()
    
    private let cellView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 0.3
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let movieInfoLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
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
        contentView.addSubview(cellView)
        contentView.addSubview(overviewLabel)
        cellView.addSubview(movieInfoLabel)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.widthAnchor.constraint(equalToConstant: 120),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            movieInfoLabel.centerYAnchor.constraint(equalTo: cellView.centerYAnchor),
            movieInfoLabel.centerXAnchor.constraint(equalTo: cellView.centerXAnchor),
            
            overviewLabel.topAnchor.constraint(equalTo: movieInfoLabel.bottomAnchor, constant: 24),
            overviewLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            overviewLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            overviewLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 24)
        ])
    }
    
    func configCell(info: MovieInfoModel, isSelected: Bool) {
        movieInfoLabel.text = info.title
        movieInfoLabel.textColor = isSelected ? .white: .black
        cellView.backgroundColor = isSelected ? .systemBlue: .white
    }
}
