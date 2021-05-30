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
    
    static let shared   = NetworkManager()
    private let baseURL = "https://api.github.com/"
    
    let cache           = NSCache<NSString, UIImage>()
    
    func getFollowers(with username: String, page: Int) -> Observable<[Follower]> {
        let endpoint = baseURL + "users/\(username)/followers?per_page=100&page=\(page)"
        let url = URL(string: endpoint)!
        
        return Observable.create { observer -> Disposable in
            
            let task = self.parseJSON(with: url) { results in
                switch results {
                case .success(let followers):
                    observer.onNext(followers)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                task.cancel()
            }
        }
    }
    
    private func parseJSON(with url: URL, completion: @escaping (Result<[Follower], GFError>) -> Void) -> URLSessionDataTask{
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder                     = JSONDecoder()
                decoder.keyDecodingStrategy     = .convertFromSnakeCase
                decoder.dateDecodingStrategy    = .iso8601
                
                let results = try decoder.decode([Follower].self, from: data)
                DispatchQueue.main.async { completion(.success(results) )}
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
        return task
    }
}
