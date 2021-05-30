//
//  FollowersListViewModel.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 22/05/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    func transform(input: Input) -> Output
}

class FollowersListViewModel {
    
    let searchText      = BehaviorRelay<String>(value: "")
    let page            = BehaviorRelay<Int>(value: 1)
    var followers       = BehaviorRelay<[FollowerViewModel]>(value: [])
    var filterFollowers = BehaviorRelay<[FollowerViewModel]>(value: [])
    let hasMoreFollower = BehaviorRelay<Bool>(value: false)
    
    private let manager: NetworkManager
        
    let disposeBag      = DisposeBag()
    
    init(manager: NetworkManager) {
        self.manager = manager
    }
    
    func fetchFollowers(with username: String) {
        searchText.asObservable()
            .filter { $0.count > 2 }
            .throttle(.seconds(3), scheduler: MainScheduler.instance)
            .distinctUntilChanged()
            .flatMapLatest { query in
                self.manager.getFollowers(with: query, page: self.page.value)
            }.subscribe { followers in
                self.followers.accept(followers.map { FollowerViewModel(follower: $0)})
                print(self.followers.value)
            } onError: { error in
                print(error)
            }.disposed(by: disposeBag)
    }
    
}
