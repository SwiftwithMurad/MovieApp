//
//  MovieDetailCell.swift
//  MovieApp
//
//  Created by Mac on 04.02.25.
//

import UIKit

class MovieDetailCell: UICollectionViewCell {
    var movie = [MovieResult]()
//    var movieItems = [MovieDetailModel]()
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Similar Movies"
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let overviewText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
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
        [collection, label, overviewText].forEach { contentView.addSubview($0) }
        collection.backgroundColor = .systemGray5
        collection.delegate = self
        collection.dataSource = self
        collection.register(ImageLabelCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            overviewText.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            overviewText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            overviewText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            collection.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 0),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
    }
    
    func configMovie(result: [MovieResult]) {
        movie = result
        collection.reloadData()
    }
    
    func configModel(title: String, cell: [MovieResult], overview: String) {
        label.text = title
        movie = cell
        overviewText.text = overview
    }
}

extension MovieDetailCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageLabelCell
        cell.config(data: movie[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: collectionView.frame.height)
    }
}
