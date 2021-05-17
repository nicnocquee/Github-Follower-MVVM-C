//
//  Follower.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import Foundation

struct Follower: Codable {
    let uuid = UUID()
    
    private enum CodingKeys: String, CodingKey { case login, avatarUrl}
    
    var login: String
    var avatarUrl: String
}

extension Follower: Hashable {
    static func ==(lhs: Follower, rhs: Follower) -> Bool {
        return lhs.uuid == rhs.uuid
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
}
