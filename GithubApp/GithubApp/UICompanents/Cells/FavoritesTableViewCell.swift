//
//  FavoritesTableViewCell.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 6.04.2022.
//

import UIKit

class FavoritesTableViewCell: UITableViewCell {

    static let identifier = "FavoritesTableViewCell"

    let avatarImageView = GHAvatarImageView(frame: .zero)
    let usernameLabel = GHTitleLabel(textAlignment: .left, fontSize: 24)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(favorite: Follower) {
        usernameLabel.text = favorite.login
        avatarImageView.downloadImage(from: favorite.avatarUrl)
    }
    
    private func configure() {
        addSubview(avatarImageView)
        addSubview(usernameLabel)
        
        accessoryType = .disclosureIndicator
        let padding: CGFloat = 16
        
        NSLayoutConstraint.activate(
            [
                avatarImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
                avatarImageView.heightAnchor.constraint(equalToConstant: 62),
                avatarImageView.widthAnchor.constraint(equalToConstant: 62),
                
                usernameLabel.centerYAnchor.constraint(equalTo: avatarImageView.centerYAnchor),
                usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: padding),
                usernameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -padding),
                usernameLabel.heightAnchor.constraint(equalToConstant: 30)
            ]
        )
    }
    
}
