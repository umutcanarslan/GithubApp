//
//  GHEmptyStateView.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 28.03.2022.
//

import UIKit

class GHEmptyStateView: UIView {

    let messageLabel  = GHTitleLabel(textAlignment: .center, fontSize: 20)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        emptyStateViewConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(message: String) {
        self.init(frame: .zero)
        messageLabel.text = message
    }
    
    private func emptyStateViewConfigure() {
        addSubview(messageLabel)
        addSubview(logoImageView)
        
        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        logoImageView.image = UIImage(named: "empty-state-logo")
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200),
                messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                messageLabel.heightAnchor.constraint(equalToConstant: 200),
                
                logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
                logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
                logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 200),
                logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 50)
            ]
        )
    }
    
}
