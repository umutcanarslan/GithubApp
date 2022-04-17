//
//  UIViewController+Extension.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 27.03.2022.
//

import UIKit
import SafariServices

extension UIViewController {

    func presentAlertOnMainThread(alertHeader: String, alertMessage: String, buttonText: String) {
        let alertViewController = GHAlertViewController(
            alertHeader: alertHeader,
            alertMessage: alertMessage,
            buttonText: buttonText
        )
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        self.present(alertViewController, animated: true)
    }
    
    func presentAlert(alertHeader: String, alertMessage: String, buttonText: String) {
        let alertViewController = GHAlertViewController(
            alertHeader: alertHeader,
            alertMessage: alertMessage,
            buttonText: buttonText
        )
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        self.present(alertViewController, animated: true)
    }

    func presentDefaultError() {
        let alertViewController = GHAlertViewController(
            alertHeader: "Something Went Wrong",
            alertMessage: "We were  unable to complete your task at this time. Please try again.",
            buttonText: "Okey"
        )
        alertViewController.modalPresentationStyle = .overFullScreen
        alertViewController.modalTransitionStyle = .crossDissolve
        self.present(alertViewController, animated: true)
    }
    
    func presentWebView(with url: URL) {
        let safariViewController = SFSafariViewController(url: url)
        safariViewController.preferredControlTintColor = .systemBlue
        safariViewController.preferredBarTintColor = .systemBackground
        present(safariViewController, animated: true)
    }

}
