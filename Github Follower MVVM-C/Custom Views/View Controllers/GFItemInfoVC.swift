//
//  GFItemInfoVC.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

protocol UserInfoDelegateVC: AnyObject {
    func didTapGithubProfile(user: User)
    func didTapGetFollower(user: User)
}

class GFItemInfoVC: UIViewController {
    
    let stackView       = UIStackView()
    let reposView       = GFItemInfoView()
    let followerView    = GFItemInfoView()
    let calloutBtn      = GFButton()
    
    let padding: CGFloat = 20
    
    var user: User!
    
    weak var delegate: UserInfoDelegateVC!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBackgroundView()
        layoutUI()
        setupCalloutButton()
    }
    
    private func setupBackgroundView() {
        view.layer.cornerRadius = 18
        view.backgroundColor    = .secondarySystemBackground
    }
    
    private func setupCalloutButton() {
        calloutBtn.addTarget(self, action: #selector(calloutButtonTapped), for: .touchUpInside)
    }
    
    @objc func calloutButtonTapped() {}
    
    private func layoutUI() {
        view.addSubview(stackView)
        view.addSubview(calloutBtn)
        
        stackView.axis          = .horizontal
        stackView.distribution  = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(reposView)
        stackView.addArrangedSubview(followerView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            stackView.heightAnchor.constraint(equalToConstant: 50),
            
            calloutBtn.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
            calloutBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            calloutBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            calloutBtn.heightAnchor.constraint(equalToConstant: 44)
        ])
        
    }
}
