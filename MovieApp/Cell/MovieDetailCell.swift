//
//  MovieDetailCell.swift
//  MovieApp
//
//  Created by Mac on 04.02.25.
//

import UIKit

class MovieDetailCell: UICollectionViewCell {
    var movie = [MovieInfoModel]()
    var movieCell: [MovieInfoModel] = [.init(title: "Overview", movie: []), .init(title: "Similar Movies", movie: [])]

    private let collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = .init(top: 0, left: 60, bottom: 0, right: 32)
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
        contentView.addSubview(collection)
        collection.backgroundColor = .systemGray5
        collection.delegate = self
        collection.dataSource = self
        collection.register(MovieInfoCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0)
        ])
    }
    
    func config(movie: [MovieInfoModel]) {
        self.movie = movie
    }
}

extension MovieDetailCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieInfoCell
        cell.configCell(info: movieCell[indexPath.row], isSelected: movieCell[indexPath.row].isSelected ?? false)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 150, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for (index, _) in movieCell.enumerated() {
            movieCell[indexPath.row].isSelected = index == indexPath.row
        }
        collection.reloadData()
    }
}
