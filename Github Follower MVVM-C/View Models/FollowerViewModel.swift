//
//  FollowerViewModel.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 19/05/21.
//

import Foundation
import RxSwift
import RxCocoa

struct FollowerViewModel {
    
    let username: String
    let avatarUrl: String
}

extension FollowerViewModel {
    
    init(follower: Follower) {
        self.username   = follower.login
        self.avatarUrl  = follower.avatarUrl
    }
}

extension FollowerViewModel: Hashable {
    func hash(into hasher: inout Hasher) {
        hasher.combine(username)
    }
    
    static func == (lhs: FollowerViewModel, rhs: FollowerViewModel) -> Bool {
        return lhs.username == rhs.username
    }
}
