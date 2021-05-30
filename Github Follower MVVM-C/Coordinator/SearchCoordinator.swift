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
    private let viewModel         = FollowersListViewModel(manager: NetworkManager())
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let searchVC            = SearchVC(viewModel: viewModel)
        searchVC.tabBarItem     = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        searchVC.coordinator    = self
        navigationController.pushViewController(searchVC, animated: false)
    }
    
    func pushToFollowersList(username: String, viewModel: FollowersListViewModel) {
        let followersListVC = FollowersListVC(viewModel: viewModel)
        followersListVC.title = username
        navigationController.pushViewController(followersListVC, animated: true)
    }
    
    func childDidFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
