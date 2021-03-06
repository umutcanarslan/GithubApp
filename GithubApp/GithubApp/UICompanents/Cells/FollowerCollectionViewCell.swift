//
//  FollowerCollectionViewCell.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 28.03.2022.
//

import UIKit

class FollowerCollectionViewCell: UICollectionViewCell {

    static let identifier = "FollowerCollectionViewCell"

    let avatarImageView = GHAvatarImageView(frame: .zero)
    let usernameLabel = GHTitleLabel(textAlignment: .center, fontSize: 16)

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(follower: Follower) {
        usernameLabel.text = follower.login
        NetworkManager.shared.downloadImage(from: follower.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }
    }

    private func configure() {
        usernameLabel.textAlignment = .center

        addSubviews(avatarImageView, usernameLabel)

        let padding: CGFloat = 16

        NSLayoutConstraint.activate(
            [
                avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: padding),
                avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                avatarImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
                
                usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: (padding / 4)),
                usernameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
                usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
                usernameLabel.heightAnchor.constraint(equalToConstant: 20)
            ]
        )
    }

}
