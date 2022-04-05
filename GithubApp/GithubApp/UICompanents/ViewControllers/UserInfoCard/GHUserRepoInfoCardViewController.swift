//
//  GHUserRepoInfoCardViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 4.04.2022.
//

import UIKit

class GHUserRepoInfoCardViewController: GHUserInfoCardViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCard()
    }
    
    private func configureCard() {
        itemInfoCardLeft.set(infoItemType: .repositories, withCount: user.publicRepos)
        itemInfoCardRight.set(infoItemType: .gists, withCount: user.publicGists)
        actionButton.set(backgroundColor: .systemPink, title: "GitHub Profile")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }

}
