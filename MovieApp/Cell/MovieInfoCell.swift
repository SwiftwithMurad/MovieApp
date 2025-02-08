//
//  MovieInfoCell.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import UIKit

class MovieInfoCell: UICollectionViewCell {
    var movie = [MovieInfoModel]()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configUI()
        configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configUI() {

    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
           
        ])
    }
    
    func configCell(info: ImageLabelProtocol) {

    }
}
