//
//  FollowersListVC.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class FollowersListVC: UIViewController {
    
    weak var coordinator: FollowersCoordinator?
    var viewModel: FollowersListViewModel
    
    enum Section { case main }
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, FollowerViewModel>!
    var username: String!
    
    init(viewModel: FollowersListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
        setupSearchController()
        setupCollectionView()
        setupCollectionViewDataSource()
        viewModel.fetchFollowers(with: username)
        setupSnapshot()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupViewController() {
        view.backgroundColor = .systemBackground
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc private func addButtonTapped() {
        
    }
    

    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createCollectionViewFlowLayout(in: view))
        view.addSubview(collectionView)
//        collectionView.delegate = self
        collectionView.register(FollowersCell.self, forCellWithReuseIdentifier: FollowersCell.reuseID)
        collectionView.backgroundColor = .systemBackground
    }
    
    private func setupCollectionViewDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, FollowerViewModel>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowersCell.reuseID, for: indexPath) as! FollowersCell
            cell.set(followerVM: follower)
            
            return cell
        })
    }
    
    private func setupSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, FollowerViewModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(viewModel.followers.value)
        
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
    
    private func setupSearchController() {
        let searchController                    = UISearchController()
//        searchController.searchResultsUpdater   = self
//        searchController.searchBar.delegate     = self
        searchController.searchBar.placeholder  = "Search a username"
        navigationItem.searchController         = searchController
    }
    

}
