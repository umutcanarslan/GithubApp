//
//  GHAlertViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 27.03.2022.
//

import UIKit

class GHAlertViewController: UIViewController {
    
    let containerView = GHAlertContainerView()
    let titleLabel = GHTitleLabel(textAlignment: .center, fontSize: 20)
    let messageLabel = GHBodyLabel(textAlignment: .center)
    let actionButton = GHButton(backgroundColor: .systemRed, title: "Okey")
    
    var alertHeader: String?
    var alertMessage: String?
    var buttonText: String?
    
    let padding: CGFloat = 16
    
    init(alertHeader: String, alertMessage: String, buttonText: String) {
        super.init(nibName: nil, bundle: nil)
        self.alertHeader = alertHeader
        self.alertMessage = alertMessage
        self.buttonText = buttonText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureAlert()
    }

    private func setupAlert() {
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
    }
    
    @objc private func buttonTapped() {
        dismiss(animated: true)
    }
    
    private func configureAlert() {
        view.addSubview(containerView)

        containerView.addSubview(titleLabel)
        titleLabel.text = alertHeader ?? "Something went wrong"
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(messageLabel)
        messageLabel.text = alertMessage ?? "A problem was encountered, please try again."
        messageLabel.numberOfLines = 4
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(actionButton)
        actionButton.setTitle(buttonText ?? "Okey", for: .normal)
        actionButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                containerView.widthAnchor.constraint(equalToConstant: 280),
                containerView.heightAnchor.constraint(equalToConstant: 220),
                
                titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
                titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
                titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
                titleLabel.heightAnchor.constraint(equalToConstant: 28),
                
                messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: (padding / 2)),
                messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
                messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
                
                actionButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: padding),
                actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
                actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
                actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
                actionButton.heightAnchor.constraint(equalToConstant: 44)
            ]
        )
    }

}
