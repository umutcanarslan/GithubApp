//
//  GHUserFollowInfoCardViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 4.04.2022.
//

import UIKit

class GHUserFollowInfoCardViewController: GHUserInfoCardViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCard()
    }
    
    private func configureCard() {
        itemInfoCardLeft.set(infoItemType: .follower, withCount: user.followers)
        itemInfoCardRight.set(infoItemType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
    
}
