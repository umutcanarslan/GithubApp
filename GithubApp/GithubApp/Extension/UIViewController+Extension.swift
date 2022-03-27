//
//  UIViewController + Extension.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 27.03.2022.
//

import UIKit

extension UIViewController {
    
    func presentAlertOnMainThread(alertHeader: String, alertMessage: String, buttonText: String) {
        DispatchQueue.main.async {
            let alertViewController = GHAlertViewController(
                alertHeader: alertHeader,
                alertMessage: alertMessage,
                buttonText: buttonText
            )
            alertViewController.modalPresentationStyle = .overFullScreen
            alertViewController.modalTransitionStyle = .crossDissolve
            self.present(alertViewController, animated: true)
        }
    }
    
}
