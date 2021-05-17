//
//  FollowersCoordinator.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class FollowersCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let followersListVC = FollowersListVC()
        followersListVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        followersListVC.coordinator = self
        navigationController.pushViewController(followersListVC, animated: true)
    }
    
    
}
