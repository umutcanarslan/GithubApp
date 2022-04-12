//
//  UIView+Extension.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 12.04.2022.
//

import UIKit

extension UIView {

    func addSubviews(_ views: UIView...) {
        for view in views { addSubview(view) }
    }

}
