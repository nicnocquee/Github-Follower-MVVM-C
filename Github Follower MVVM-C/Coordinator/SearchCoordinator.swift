//
//  SearchCoordinator.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class SearchCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewModel           = FollowerViewModel(manager: NetworkManager())
        let searchVC            = SearchVC(viewModel: viewModel)
        searchVC.tabBarItem     = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        searchVC.coordinator    = self
        navigationController.pushViewController(searchVC, animated: false)
    }
    
    func pushToFollowersList(username: String) {
        let followersListVC = FollowersListVC()
        followersListVC.title = username
        navigationController.pushViewController(followersListVC, animated: true)
    }
    
    func childDidFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
