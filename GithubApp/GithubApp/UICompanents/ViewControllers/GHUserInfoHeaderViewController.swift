//
//  GHAvatarHeaderViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 29.03.2022.
//

import UIKit

class GHUserInfoHeaderViewController: UIViewController {
    
    private let avatarImageView = GHAvatarImageView(frame: .zero)
    private let usernameLabel = GHTitleLabel(textAlignment: .left, fontSize: 26)
    private let nameLabel = GHSecondaryTitleLabel(fontSize: 20)
    private let locationIcon = UIImageView()
    private let locationLabel = GHSecondaryTitleLabel(fontSize: 16)
    private let bioLabel = GHBodyLabel(textAlignment: .left)
    
    var user: User!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAvatarHeader()
        configureUIElement()
        navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
    }
    
    private func configureUIElement() {
        downloadImage()

        usernameLabel.text = user.login
        nameLabel.text = user.name ?? ""
        locationLabel.text = user.location ?? "No location"
        bioLabel.text = user.bio ?? "No biography available"
        bioLabel.numberOfLines = 3
        
        locationIcon.image = UIImage(systemName: SFSymbol.location)
        locationIcon.tintColor = .systemBlue
    }

    private func downloadImage() {
        NetworkManager.shared.downloadImage(from: user.avatarUrl) { [weak self] image in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.avatarImageView.image = image
            }
        }
    }
    
    private func configureAvatarHeader() {
        let padding: CGFloat = 16
        let secondaryPadding: CGFloat = 8
        
        view.addSubview(avatarImageView)
        view.addSubview(usernameLabel)
        view.addSubview(nameLabel)
        view.addSubview(locationIcon)
        view.addSubview(locationLabel)
        view.addSubview(bioLabel)
        
        avatarImageView.translatesAutoresizingMaskIntoConstraints = false
        usernameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                avatarImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
                avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                avatarImageView.widthAnchor.constraint(equalToConstant: 90),
                avatarImageView.heightAnchor.constraint(equalToConstant: 90),
                
                usernameLabel.topAnchor.constraint(equalTo: avatarImageView.topAnchor),
                usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: secondaryPadding),
                usernameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                usernameLabel.heightAnchor.constraint(equalToConstant: 30),
                
                nameLabel.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: secondaryPadding),
                nameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: secondaryPadding),
                nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                nameLabel.heightAnchor.constraint(equalToConstant: 20),
                
                locationIcon.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: secondaryPadding),
                locationIcon.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: secondaryPadding),
                locationIcon.widthAnchor.constraint(equalToConstant: 24),
                locationIcon.heightAnchor.constraint(equalToConstant: 24),
                
                locationLabel.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
                locationLabel.leadingAnchor.constraint(equalTo: locationIcon.trailingAnchor, constant: secondaryPadding),
                locationLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                locationLabel.heightAnchor.constraint(equalToConstant: 24),
                
                bioLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: secondaryPadding),
                bioLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                bioLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                bioLabel.heightAnchor.constraint(equalToConstant: 72)
            ]
        )
    }
    
}
