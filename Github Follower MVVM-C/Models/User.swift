//
//  User.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    var name: String?
    var location: String?
    var bio: String?
    let publicGists: Int
    let publicRepos: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: Date
}
