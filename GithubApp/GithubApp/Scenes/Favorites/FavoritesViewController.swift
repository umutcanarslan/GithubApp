//
//  FavoritesViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 25.03.2022.
//

import UIKit

class FavoritesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
    }
    
    private func favoriteControl() {
        PersistenceManager.retrieveFavorites { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let favorites):
                break
            case .failure(let error):
                break
            }
        }
    }
    
}
