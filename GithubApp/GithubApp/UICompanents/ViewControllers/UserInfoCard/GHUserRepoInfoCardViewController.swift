//
//  GHUserRepoInfoCardViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 4.04.2022.
//

import UIKit

protocol GHUserRepoInfoCardViewControllerDelegate: AnyObject {
    func didTapGitHubProfile(for user: User)
}

class GHUserRepoInfoCardViewController: GHUserInfoCardViewController {

    weak var delegate: GHUserRepoInfoCardViewControllerDelegate!

    init(user: User, delegate: GHUserRepoInfoCardViewControllerDelegate) {
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
        itemInfoCardLeft.set(infoItemType: .repositories, withCount: user.publicRepos)
        itemInfoCardRight.set(infoItemType: .gists, withCount: user.publicGists)
        actionButton.set(color: .systemPink, title: "GitHub Profile", systemImageName: "person")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGitHubProfile(for: user)
    }

}
