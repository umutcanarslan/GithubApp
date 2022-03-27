//
//  FollowerListViewModel.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 27.03.2022.
//

import UIKit

struct FollowerListViewModelState {
    enum Change {
        case idle
        case fetching(Bool)
        case success([Follower])
        case error(GHError)
    }
}

class FollowerListViewModel: UIViewController {
    
    private var page = 1
    
    private(set) var state = FollowerListViewModelState()
    var onChange: ((FollowerListViewModelState.Change) -> Void)?
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.emit(change: .idle)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func emit(change: FollowerListViewModelState.Change) {
        DispatchQueue.main.async {
            self.onChange?(change)
        }
    }
    
    private func getFollowers(username: String, page: Int) {
        emit(change: .fetching(true))
        
        NetworkManager.shared.getFollowers(for: username, page: self.page) { result in
            self.emit(change: .fetching(false))
            switch result {
            case .success(let followers):
                print(followers)
            case .failure(let error):
                self.presentAlertOnMainThread(
                    alertHeader: "Error!",
                    alertMessage: error.localizedDescription,
                    buttonText: "Okey"
                )
            }
        }
    }
    
}
