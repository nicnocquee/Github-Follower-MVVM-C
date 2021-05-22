//
//  FollowerViewModel.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 19/05/21.
//

import Foundation
import RxSwift
import RxCocoa

class FollowerViewModel {
    
    // Input
    var searchText      = BehaviorRelay<String>(value: "")
    var currentPage     = BehaviorRelay<Int>(value: 1)
    let errorMessage    = PublishSubject<Void>()
    
    // Output
    let hasUsername     = BehaviorSubject<Bool>(value: false)
    let hasMoreFollower = BehaviorSubject<Bool>(value: false)
    var followers       = BehaviorRelay<[Follower]>(value: [])
    
    let disposeBag      = DisposeBag()
    
    private let manager: NetworkManager
    
    init(manager: NetworkManager) {
        self.manager = manager
    }
    
    func fetchFollowers() {
        manager.getFollowers(with: searchText.value, page: currentPage.value)
            .subscribe { [weak self] followers in
//                self?.followers.value = followers
                print(followers)
            } onError: { [weak self] error in
                print(error)
            }.disposed(by: disposeBag)
        
    }
}
