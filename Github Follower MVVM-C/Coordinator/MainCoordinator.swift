//
//  Coordinator.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    let window: UIWindow
    
    
    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        window.rootViewController = MainTabBarController()
        window.makeKeyAndVisible()
    }
    
    func searchVC() {
        let searchCoordinator = SearchCoordinator(navigationController: navigationController)
        searchCoordinator.parentCoordinator = self
        childCoordinators.append(searchCoordinator)
    }
    
    func followersVC() {
        let followersCoordinator = SearchCoordinator(navigationController: navigationController)
        followersCoordinator.parentCoordinator = self
        childCoordinators.append(followersCoordinator)
    }
    
    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                return
            }
        }
    }
}
