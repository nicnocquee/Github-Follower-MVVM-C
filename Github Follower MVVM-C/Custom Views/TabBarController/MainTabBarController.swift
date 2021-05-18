//
//  MainTabBarController.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    private let searchCoordinator = SearchCoordinator(navigationController: UINavigationController())
    private let followerCoordinator = FollowersCoordinator(navigationController: UINavigationController())

    override func viewDidLoad() {
        super.viewDidLoad()

        searchCoordinator.start()
        followerCoordinator.start()
        
        viewControllers = [searchCoordinator.navigationController, followerCoordinator.navigationController]
    }

}
