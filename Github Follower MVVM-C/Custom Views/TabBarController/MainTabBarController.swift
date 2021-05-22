//
//  MainTabBarController.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let searchCoordinator = SearchCoordinator(navigationController: UINavigationController())
    private let favoritesCoordinator = FavoritesCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()

        setupAppearance()
        searchCoordinator.start()
        favoritesCoordinator.start()
        
        viewControllers = [searchCoordinator.navigationController, favoritesCoordinator.navigationController]
    }
    
    private func setupAppearance() {
        UITabBar.appearance().tintColor = .systemGreen
        UINavigationBar.appearance().prefersLargeTitles = true
        UINavigationBar.appearance().tintColor = .systemGreen
    }

}
