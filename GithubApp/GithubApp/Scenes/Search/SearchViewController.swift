//
//  SearchViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 25.03.2022.
//

import UIKit

class SearchViewController: UIViewController {
    
    private let logoImageView = UIImageView()
    private let usernameTextField = GHTextField()
    private let callToActionButton = GHButton(backgroundColor: .systemGreen, title: "Get Followers")
    
    var isUsernameEntered: Bool {
        return !usernameTextField.text!.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        usernameTextField.becomeFirstResponder()
    }
    
    @objc private func dismissKeyboard() {
        usernameTextField.resignFirstResponder()
    }
    
}

//  MARK: UI Configure
extension SearchViewController {
    
    private func setupUI() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        view.addSubview(usernameTextField)
        usernameTextField.delegate = self
        
        view.addSubview(callToActionButton)
        callToActionButton.addTarget(self, action: #selector(pushFollowerListViewController), for: .touchUpInside)
        
        NSLayoutConstraint.activate(
            [
                logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoImageView.heightAnchor.constraint(equalToConstant: 200),
                logoImageView.widthAnchor.constraint(equalToConstant: 200),
                
                usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
                usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                usernameTextField.heightAnchor.constraint(equalToConstant: 50),
                
                callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
                callToActionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
                callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
                callToActionButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
}

//  MARK: Delegates
extension SearchViewController: UITextFieldDelegate {
    
    @objc func pushFollowerListViewController() {
        guard isUsernameEntered else { return }
        let followerListViewController = FollowerListViewController()
        followerListViewController.username = usernameTextField.text
        followerListViewController.title = usernameTextField.text
        navigationController?.pushViewController(followerListViewController, animated: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        pushFollowerListViewController()
        return true
    }
    
}
