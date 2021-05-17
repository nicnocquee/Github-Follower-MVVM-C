//
//  NetworkManager.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class NetworkManager {
    
    static let shared = NetworkManager()
    
    let cache           = NSCache<NSString, UIImage>()
}
