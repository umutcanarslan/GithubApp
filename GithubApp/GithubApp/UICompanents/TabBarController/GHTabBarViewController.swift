//
//  GHTabBarViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 11.04.2022.
//

import UIKit

class GHTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = .systemBlue
        UITabBar.appearance().backgroundColor = .systemGray6
        viewControllers = [createSearchNavigationController(), createFavoritesNavigationController()]
    }

    func createSearchNavigationController() -> UINavigationController {
        let searchViewController = SearchViewController()
        searchViewController.title = "Search"
        searchViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        return UINavigationController(rootViewController: searchViewController)
    }

    func createFavoritesNavigationController() -> UINavigationController {
        let favoritesViewController = FavoritesViewController()
        favoritesViewController.title = "Favorites"
        favoritesViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 1)
        return UINavigationController(rootViewController: favoritesViewController)
    }

}
