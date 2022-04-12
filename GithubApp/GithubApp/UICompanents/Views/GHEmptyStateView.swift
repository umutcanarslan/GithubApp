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
        configureMessageLabel()
        configureImageView()
    }

    private func configureMessageLabel() {
        addSubview(messageLabel)

        messageLabel.numberOfLines = 3
        messageLabel.textColor = .secondaryLabel
        messageLabel.translatesAutoresizingMaskIntoConstraints = false

        let labelCenterYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -150 : -150
        let messageLabelCenterYConstraint = messageLabel.centerYAnchor.constraint(
            equalTo: self.centerYAnchor,
            constant: labelCenterYConstant
        )
        messageLabelCenterYConstraint.isActive = true

        NSLayoutConstraint.activate(
            [
                messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200),
                messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
                messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
                messageLabel.heightAnchor.constraint(equalToConstant: 200)
            ]
        )
    }

    private func configureImageView() {
        addSubview(logoImageView)

        logoImageView.image = Images.emptyStateLogo
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        let logoBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 60 : 40
        let logoImageViewBottomConstraint = logoImageView.bottomAnchor.constraint(
            equalTo: self.bottomAnchor,
            constant: logoBottomConstant
        )
        logoImageViewBottomConstraint.isActive = true

        NSLayoutConstraint.activate(
            [
                logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
                logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
                logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 200),
            ]
        )
    }
    
}
