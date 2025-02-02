//
//  HomeCell.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import UIKit

class HomeCell: UICollectionViewCell {
    private var data = [MovieResult]()
    var handleButton: (() -> Void)?
    var handleCell: (() -> Void)?
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See all", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.sectionInset = .init(top: 0, left: 24, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
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
    
    func configCell(name: String, data: [MovieResult]) {
        title.text = name
        self.data = data
    }
    
    private func configUI() {
        collection.delegate = self
        collection.dataSource = self
        collection.register(MovieCell.self, forCellWithReuseIdentifier: "cell")
        [title, seeAllButton, collection].forEach { contentView.addSubview($0) }
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 24),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 32),
            
            seeAllButton.centerYAnchor.constraint(equalTo: title.centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            collection.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            collection.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    @objc func seeAllButtonTapped() {
        handleButton?()
    }
}

extension HomeCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MovieCell
        let cellData = data[indexPath.row]
        cell.configCell(name: cellData.title ?? "",
                        imageURL: cellData.posterPath ?? "",
                        data: data)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 168, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        handleCell?()
    }
}
