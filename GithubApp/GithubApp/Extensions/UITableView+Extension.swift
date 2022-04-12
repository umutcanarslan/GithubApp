//
//  UITableView+Extension.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 12.04.2022.
//

import UIKit

extension UITableView {

    func reloadDataOnMainThread() {
        DispatchQueue.main.async {
            self.reloadData()
        }
    }

    func removeExcessCell() {
        tableFooterView = UIView(frame: .zero)
    }

}
