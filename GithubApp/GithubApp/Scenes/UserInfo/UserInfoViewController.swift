//
//  UserInfoViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 29.03.2022.
//

import UIKit

protocol UserInfoViewControllerDelegate: AnyObject {
    func didRequestFollowers(for username: String)
}

class UserInfoViewController: GHDataLoadingViewController {
    
    let headerView = UIView()
    let userProfileInfoCard = UIView()
    let userFollowInfoCard = UIView()
    let userRegistrationDate = GHBodyLabel(textAlignment: .center)
    var itemView: [UIView] = []
    
    var username: String!
    weak var delegate: UserInfoViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getUserInfo(username: username)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.title = "\(username ?? "Github User")'s Profile"
        layoutUI()
    }
    
    private func layoutUI() {
        let padding: CGFloat = 16
        
        itemView = [headerView, userProfileInfoCard, userFollowInfoCard, userRegistrationDate]
        
        for itemView in itemView {
            view.addSubview(itemView)
            itemView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate(
                [
                    itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                    itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
                ]
            )
        }
        
        NSLayoutConstraint.activate(
            [
                headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
                headerView.heightAnchor.constraint(equalToConstant: 180),
                
                userProfileInfoCard.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
                userProfileInfoCard.heightAnchor.constraint(equalToConstant: 148),
                
                userFollowInfoCard.topAnchor.constraint(equalTo: userProfileInfoCard.bottomAnchor, constant: padding),
                userFollowInfoCard.heightAnchor.constraint(equalToConstant: 148),
                
                userRegistrationDate.topAnchor.constraint(equalTo: userFollowInfoCard.bottomAnchor, constant: padding),
                userRegistrationDate.heightAnchor.constraint(equalToConstant: 18)
            ]
        )
    }
    
    private func addChild(childViewController: UIViewController, to containerView: UIView) {
        addChild(childViewController)
        containerView.addSubview(childViewController.view)
        childViewController.view.frame = containerView.bounds
        childViewController.didMove(toParent: self)
    }
    
    @objc private func doneButtonTapped() {
        dismiss(animated: true)
    }
    
}

// MARK: Fetching Data
extension UserInfoViewController {
    
    private func getUserInfo(username: String) {
        showLoadingView()
        NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
            guard let self = self else { return }
            self.hideLoadingView()
            switch result {
            case .success(let user):
                DispatchQueue.main.sync {
                    self.configureUIElements(with: user)
                }
            case .failure(let error):
                self.presentAlertOnMainThread(
                    alertHeader: "Something went wrong.",
                    alertMessage: error.rawValue,
                    buttonText: "Okey"
                )
            }
        }
    }
    
    private func configureUIElements(with user: User) {
        self.addChild(
            childViewController: GHUserInfoHeaderViewController(user: user),
            to: self.headerView
        )
        self.addChild(
            childViewController: GHUserRepoInfoCardViewController(user: user, delegate: self),
            to: self.userProfileInfoCard
        )
        self.addChild(
            childViewController: GHUserFollowInfoCardViewController(user: user, delegate: self),
            to: self.userFollowInfoCard
        )
        self.userRegistrationDate.text = user.createdAt.convertToMonthAndYear()
    }
    
}

extension UserInfoViewController: GHUserRepoInfoCardViewControllerDelegate {

    func didTapGitHubProfile(for user: User) {
        guard let url = URL(string: user.htmlUrl) else {
            presentAlertOnMainThread(
                alertHeader: "Invalid URL",
                alertMessage: "The URL attached to this user is invalid",
                buttonText: "Okey"
            )
            return
        }
        presentWebView(with: url)
    }

}

extension UserInfoViewController: GHUserFollowInfoCardViewControllerDelegate {

    func didTapGetFollowers(for user: User) {
        guard user.followers != 0 else {
            presentAlertOnMainThread(
                alertHeader: "No Followers",
                alertMessage: "This user has no followers.",
                buttonText: "Okey"
            )
            return
        }
        delegate.didRequestFollowers(for: user.login)
        dismiss(animated: true)
    }

}
