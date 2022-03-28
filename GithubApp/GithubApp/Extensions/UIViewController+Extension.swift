//
//  UIViewController+Extension.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 27.03.2022.
//

import UIKit

fileprivate var containerView: UIView!

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
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor = .systemBackground
        containerView.alpha = 0
        
        UIView.animate(withDuration: 0.25) { containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate(
            [
                activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ]
        )
        activityIndicator.startAnimating()
    }
    
    func hideLoadingView() {
        DispatchQueue.main.async {
            containerView.removeFromSuperview()
            containerView = nil
        }
    }
    
}
