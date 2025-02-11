//
//  MovieDetailCell.swift
//  MovieApp
//
//  Created by Mac on 04.02.25.
//

import UIKit

class MovieDetailCell: UICollectionViewCell {
    var movie = [MovieResult]()
    let movieManager = MovieManager()
    var success: (() -> Void)?
    var errorHandling: ((String) -> Void)?
    var id: Int? {
        didSet {
            getMovies()
        }
    }
    
    private let label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.text = "Similar Movies"
        label.textAlignment = .left
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
        getMovies()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {
        [collection, label].forEach { contentView.addSubview($0) }
        collection.backgroundColor = .systemGray5
        collection.delegate = self
        collection.dataSource = self
        collection.register(ImageLabelCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    private func getMovies() {
        movieManager.getSimilarMovies(id: self.id ?? 0) { [weak self] data, error in
            guard let self = self else { return }
            if let error {
                errorHandling?(error)
                print(error)
            } else if let data {
                movie = data.results ?? []
//                infoModel.append(.init(title: "Similar Movies", image: nil, overview: nil, movie: data.results))
                success?()
                collection.reloadData()
            }
        }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            
            collection.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 0),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),        ])
    }
}

extension MovieDetailCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movie.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageLabelCell
//        guard let movies = infoModel[indexPath.row].movie else { return cell }
        cell.config(data: movie[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: collectionView.frame.height)
    }
}
