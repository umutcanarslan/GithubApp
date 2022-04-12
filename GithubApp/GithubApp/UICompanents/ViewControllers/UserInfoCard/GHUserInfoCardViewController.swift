//
//  GHUserInfoCardViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 4.04.2022.
//

import UIKit

class GHUserInfoCardViewController: UIViewController {
    
    let stackView = UIStackView()
    let itemInfoCardLeft = GHInfoItemView()
    let itemInfoCardRight = GHInfoItemView()
    let actionButton = GHButton()
    
    var user: User!
    weak var delegate: UserInfoViewControllerDelegate!
    
    init(user: User) {
        super.init(nibName: nil, bundle: nil)
        self.user = user
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureBackgroundView()
        configureStackView()
        configureActionButton()
        layoutUI()
    }
    
    private func configureBackgroundView() {
        view.layer.cornerRadius = 20
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        
        stackView.addArrangedSubview(itemInfoCardLeft)
        stackView.addArrangedSubview(itemInfoCardRight)
    }
    
    private func configureActionButton() {
        actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
    }
    
    @objc func actionButtonTapped() {}
    
    private func layoutUI() {
        let padding: CGFloat = 16
        
        view.addSubviews(stackView, actionButton)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                stackView.heightAnchor.constraint(equalToConstant: 50),
                
                actionButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: padding),
                actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
                actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                actionButton.heightAnchor.constraint(equalToConstant: 50)
            ]
        )
    }
    
}
