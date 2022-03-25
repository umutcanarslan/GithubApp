//
//  SearchViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 25.03.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GHTextField()
    let callToActionButton = GHButton(backgroundColor: .systemGreen, title: "Get Followers")

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCTAButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureLogoImageView() {
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate(
            [
                logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoImageView.heightAnchor.constraint(equalToConstant: 200),
                logoImageView.widthAnchor.constraint(equalToConstant: 200)
            ]
        )
    }
    
    func configureTextField() {
        view.addSubview(usernameTextField)
        
        NSLayoutConstraint.activate(
            [
                usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
                usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                usernameTextField.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
    func configureCTAButton() {
        view.addSubview(callToActionButton)
        
        NSLayoutConstraint.activate(
            [
                callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                callToActionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
                callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                callToActionButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
}
