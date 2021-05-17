//
//  GFUserInfoHeaderVC.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class GFUserInfoHeaderVC: UIViewController {
    
    let avatarImageView             = GFAvatarImageView(frame: .zero)
    let usernameLabel               = GFTitleLabel(textAlignment: .left, fontSize: 32)
    let nameLabel                   = GFSecondaryLabel(fontSize: 18)
    let locationImageView           = UIImageView()
    let locationLabel               = GFSecondaryLabel(fontSize: 18)
    let bioLabel                    = GFBodyLabel(textAlignment: .left)
            
    let padding: CGFloat            = 20
    let textImagePadding: CGFloat   = 12
    
    var user: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews(avatarImageView, usernameLabel, nameLabel, locationImageView, locationLabel, bioLabel)
        setupUI()
        setupUIElements()
    }
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUIElements() {
//        NetworkManager.shared.getImage(from: user.avatarUrl, complete: { [weak self] image in
//            guard let self = self else { return }
//            DispatchQueue.main.async { self.avatarImageView.image = image }
//        })

        usernameLabel.text      = user.login
        nameLabel.text          = user.name
        locationImageView.image = UIImage(systemName: SFSymbol.location)
        locationLabel.text      = user.location ?? "Location not found"
        bioLabel.text           = user.bio
        bioLabel.numberOfLines  = 3
    }
    
    private func addSubviews(_ views: UIView...) {
        views.forEach { v in
            view.addSubview(v)
        }
    }
    
    private func setupUI() {
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            avatarImageView.widthAnchor.constraint(equalToConstant: 90),
            avatarImageView.heightAnchor.constraint(equalToConstant: 90),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
            usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 36),
            
            nameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor, constant: 8),
            nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            nameLabel.heightAnchor.constraint(equalToConstant: 28),
            
            locationImageView.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: textImagePadding),
            locationImageView.widthAnchor.constraint(equalToConstant: 20),
            locationImageView.heightAnchor.constraint(equalToConstant: 20),
            
            locationLabel.centerYAnchor.constraint(equalTo: locationImageView.centerYAnchor),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 4),
            locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            locationLabel.heightAnchor.constraint(equalToConstant: 20),
            
            bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: textImagePadding),
            bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            bioLabel.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
