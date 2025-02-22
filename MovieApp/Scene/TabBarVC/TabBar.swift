//
//  TabBarViewController.swift
//  MovieApp
//
//  Created by Mac on 01.02.25.
//

import UIKit

class TabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllers()
    }
    
    private func setupViewControllers() {
        tabBar.isTranslucent = false
        tabBar.backgroundColor = .systemGray5
        
        let firstVC = UINavigationController(rootViewController: HomeVC())
        let secondVC = UINavigationController(rootViewController: SearchVC())
        let thirdVC = UINavigationController(rootViewController: ActorsVC())
        let fourthVC = UINavigationController(rootViewController: FavoritesVC())
        
        firstVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.fill"), tag: 1)
        secondVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        thirdVC.tabBarItem = UITabBarItem(title: "Actors", image: UIImage(systemName: "person.3"), tag: 3)
        fourthVC.tabBarItem = UITabBarItem(title: "Favorites", image: UIImage(systemName: "bookmark.fill"), tag: 4)
        
        viewControllers = [firstVC, secondVC, thirdVC, fourthVC]
    }
}
