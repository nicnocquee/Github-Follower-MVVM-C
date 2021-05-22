//
//  FavoritesVC.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 18/05/21.
//

import UIKit

class FavoritesVC: UIViewController {
    
    weak var coordinator: FavoritesCoordinator?

    let tableView               = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewController()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        getFavorite()
    }
    
    private func setupViewController() {
        view.backgroundColor    = .systemBackground
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        tableView.frame         = view.bounds
        tableView.rowHeight     = 80
//        tableView.delegate      = self
//        tableView.dataSource    = self
//        tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.reuseID)
    }

}
