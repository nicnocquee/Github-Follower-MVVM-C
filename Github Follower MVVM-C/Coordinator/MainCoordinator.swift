//
//  Coordinator.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

protocol Coordinator {
    var childCoordinator: [Coordinator] { get }
    var navigationController: UINavigationController { get set }
    
    func start()
}

class MainCoordinator: Coordinator {
    private(set) var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        searchVC()
    }
    
    func searchVC() {
        let child = SearchCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinator.append(child)
        child.start()
    }
    
    func followerListVC() {
        let child = FollowersCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinator.append(child)
        child.start()
    }
}
