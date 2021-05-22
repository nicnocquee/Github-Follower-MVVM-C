//
//  NetworkManager.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit
import RxSwift
import RxCocoa

class NetworkManager {
    
    private let baseURL = "https://api.github.com/"
    
    let cache           = NSCache<NSString, UIImage>()
    
    func getFollowers(with username: String, page: Int) -> Observable<[Follower]> {
        let endpoint = baseURL + "users/\(username)/followers?per_page=100&page=\(page)"
        let url = URL(string: endpoint)!
        
        return Observable.create { observer -> Disposable in
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                guard let error = error else {
//                    observer.onError(error)
                    return
                }
                
                guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                    return
                }
                
                guard let data = data else { return }
                
                do {
                    let followers = try JSONDecoder().decode([Follower].self, from: data)
                    observer.onNext(followers)
                    observer.onCompleted()
                } catch let error {
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
