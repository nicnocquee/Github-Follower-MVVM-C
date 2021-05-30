//
//  FollowerCell.swift
//  Github Follower MVVM-C
//
//  Created by Ferry Adi Wijayanto on 17/05/21.
//

import UIKit

class FollowersCell: UICollectionViewCell {
    static let reuseID  = "FollowerCell"
    
    private let avatarImageView     = GFAvatarImageView(frame: .zero)
    private let usernameLabel       = GFTitleLabel(textAlignment: .center, fontSize: 16)
    
    fileprivate let padding: CGFloat = 8
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(followerVM: FollowerViewModel) {
        usernameLabel.text = followerVM.username
//        NetworkManager.shared.getImage(from: follower.avatarUrl, complete: { [weak self] image in
//            guard let self = self else { return }
//            DispatchQueue.main.async { self.avatarImageView.image = image }
//        })
    }
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        NSLayoutConstraint.activate([
            avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
            
            usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
            usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            usernameLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
