//
//  GHUserFollowInfoCardViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 4.04.2022.
//

import UIKit

protocol GHUserFollowInfoCardViewControllerDelegate: AnyObject {
    func didTapGetFollowers(for user: User)
}

class GHUserFollowInfoCardViewController: GHUserInfoCardViewController {

    weak var delegate: GHUserFollowInfoCardViewControllerDelegate!

    init(user: User, delegate: GHUserFollowInfoCardViewControllerDelegate) {
        super.init(user: user)
        self.delegate = delegate
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
