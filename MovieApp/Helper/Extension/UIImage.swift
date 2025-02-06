//
//  UIImage.swift
//  MovieApp
//
//  Created by Mac on 05.02.25.
//

import UIKit
import Foundation
import Kingfisher

extension UIImageView {
    func loadImage(with url: String) {
        let fullPath = NetworkHelper.shared.imageURL + url
        guard let url = URL(string: fullPath) else { return }
        self.kf.setImage(with: url)
    }
}
