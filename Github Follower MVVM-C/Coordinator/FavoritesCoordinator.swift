//
//  FavoritesCoordinator.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 18/05/21.
//

import UIKit

class FavoritesCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let favoritesVC = FavoritesVC()
        favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        favoritesVC.coordinator = self
        navigationController.pushViewController(favoritesVC, animated: false)
    }
    
        
}
