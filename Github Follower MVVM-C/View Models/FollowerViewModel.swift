//
//  FollowerViewModel.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 19/05/21.
//

import Foundation
import RxSwift
import RxCocoa

protocol FollowersViewModelInput {
    func didSelect(index: IndexPath)
    func didSearch(user: String, page: Int)
}

protocol FollowersViewModelOutput {
    var followers: Driver<[Follower]> { get }
    var page: Driver<Void> { get set }
}

protocol FollowersViewModelType {
    var inputs: FollowersViewModelInput { get }
    var outputs: FollowersViewModelOutput { get }
}

class FollowerViewModel {
    
    // Input
    let searchText      = PublishSubject<String>()
    var page            = PublishSubject<Void>()
    let errorMessage    = PublishSubject<Void>()
    
    // Output
    let hasUsername     = BehaviorSubject<Bool>(value: false)
    let hasMoreFollower = BehaviorSubject<Bool>(value: false)
    var followers       = BehaviorSubject<[Follower]>(value: [])
    
    let disposeBag      = DisposeBag()
    
    
    private let manager: NetworkManager
    
    init(manager: NetworkManager) {
        self.manager = manager
    }
    
    func fetchFollowers() {
        let currentPage = searchText
            .filter { $0.count > 2 }
            .distinctUntilChanged()
                .flatMapLatest { searchText in
                    return self.page.asObservable()
                        .startWith(())
                        .scan(0) { (pageNumber, _) -> Int in
                            pageNumber + 1
                        }
                        .map { pageNumber in
                            (searchText, pageNumber)
                        }
                }
                .map { (searchText, pageNumber) in
                    self.manager.getFollowers(with: searchText, page: pageNumber)
                }
        
        currentPage.subscribe(onNext: { print($0) })
            .disposed(by: disposeBag)
        
    }
}
