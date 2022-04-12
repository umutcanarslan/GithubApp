//
//  UIView+Extension.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 12.04.2022.
//

import UIKit

extension UIView {

    func pinToEdges(of superview: UIView) {
        superview.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(
            [
                topAnchor.constraint(equalTo: superview.topAnchor),
                leadingAnchor.constraint(equalTo: superview.leadingAnchor),
                trailingAnchor.constraint(equalTo: superview.trailingAnchor),
                bottomAnchor.constraint(equalTo: superview.bottomAnchor),
            ]
        )
    }

    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }

}
