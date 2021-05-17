//
//  GFFollowerItemVC.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        reposView.set(itemInfoType: .followers, with: user.followers)
        followerView.set(itemInfoType: .following, with: user.following)
        calloutBtn.set(backgroundColor: .systemGreen, title: "Get Follower")
    }
    
    override func calloutButtonTapped() {
        delegate.didTapGetFollower(user: user)
    }
}
