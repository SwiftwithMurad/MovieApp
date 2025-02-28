//
//  ViewController.swift
//  MovieApp
//
//  Created by Mac on 28.02.25.
//

import UIKit

extension UIViewController {
    func showAlert(message: String) {
        let alertController =  UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
}
