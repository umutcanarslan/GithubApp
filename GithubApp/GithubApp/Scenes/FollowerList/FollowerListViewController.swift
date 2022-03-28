//
//  FollowerListViewController.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 27.03.2022.
//

import UIKit

class FollowerListViewController: UIViewController {
    
    enum Section { case main }
    
    var followers: [Follower] = []
    var username: String!
    var page = 1
    var hasMoreFollow = true
    
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupCollectionView()
        getFollowers(username: username, page: page)
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func getFollowers(username: String, page: Int) {
        NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let followers):
                if followers.count < 100 { self.hasMoreFollow = false }
                self.followers.append(contentsOf: followers)
                self.updateData()
            case .failure(let error):
                self.presentAlertOnMainThread(
                    alertHeader: "Bad Stuff Happend",
                    alertMessage: error.rawValue,
                    buttonText: "OK"
                )
            }
        }
    }
    
}

// MARK: Configure Collection View
extension FollowerListViewController {
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.configureCollectionView(in: view))
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.backgroundColor = .systemBackground
        collectionView.register(FollowerCollectionViewCell.self, forCellWithReuseIdentifier: FollowerCollectionViewCell.identifier)
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section, Follower>(
            collectionView: collectionView,
            cellProvider: { (collectionView, indexPath, follower) -> UICollectionViewCell? in
                let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: FollowerCollectionViewCell.identifier,
                    for: indexPath
                ) as? FollowerCollectionViewCell
                cell?.set(follower: follower)
                return cell
            }
        )
    }
    
    private func updateData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
        snapshot.appendSections([.main])
        snapshot.appendItems(followers)
        
        DispatchQueue.main.async {
            self.dataSource.apply(snapshot, animatingDifferences: true)
        }
    }
    
}

extension FollowerListViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let offSet = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height
        
        if offSet > (contentHeight - height) {
            guard hasMoreFollow else { return }
            page += 1
            getFollowers(username: username, page: page)
        }
    }
}
