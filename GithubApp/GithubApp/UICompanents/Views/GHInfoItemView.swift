//
//  GHInfoItemView.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 31.03.2022.
//

import UIKit

enum InfoItemType {
    case repositories
    case gists
    case follower
    case following
}

class GHInfoItemView: UIView {
    
    let symbolImageView = UIImageView()
    let titleLabel = GHTitleLabel(textAlignment: .left, fontSize: 14)
    let countLabel = GHTitleLabel(textAlignment: .center, fontSize: 14)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(symbolImageView)
        addSubview(titleLabel)
        addSubview(countLabel)
        
        symbolImageView.translatesAutoresizingMaskIntoConstraints = false
        symbolImageView.contentMode = .scaleAspectFill
        symbolImageView.tintColor = .label
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.tintColor = .label
        
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.tintColor = .secondaryLabel
        
        NSLayoutConstraint.activate(
        [
            symbolImageView.topAnchor.constraint(equalTo: self.topAnchor),
            symbolImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            symbolImageView.widthAnchor.constraint(equalToConstant: 20),
            symbolImageView.heightAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 8),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
            countLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            countLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            countLabel.heightAnchor.constraint(equalToConstant: 18)
        ]
        )
    }
    
    func set(infoItemType: InfoItemType, withCount count: Int) {
        switch infoItemType {
        case .repositories:
            symbolImageView.image = UIImage(systemName: SFSymbol.repositories)
            titleLabel.text = "Public Respos"
        case .gists:
            symbolImageView.image = UIImage(systemName: SFSymbol.gists)
            titleLabel.text = "Public Gists"
        case .follower:
            symbolImageView.image = UIImage(systemName: SFSymbol.follower)
            titleLabel.text = "Follower"
        case.following:
            symbolImageView.image = UIImage(systemName: SFSymbol.following)
            titleLabel.text = "Following"
        }
        countLabel.text = String(count)
    }
    
}
