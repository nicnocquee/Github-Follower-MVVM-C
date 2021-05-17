//
//  GFRepoItemVC.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class GFRepoItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        reposView.set(itemInfoType: .repos, with: user.publicRepos)
        followerView.set(itemInfoType: .gists, with: user.publicGists)
        calloutBtn.set(backgroundColor: .systemPurple, title: "Github Profile")
    }
    
    override func calloutButtonTapped() {
        delegate.didTapGithubProfile(user: user)
    }
}
