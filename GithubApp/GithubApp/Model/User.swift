//
//  User.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 27.03.2022.
//

import Foundation

struct User: Codable {
    var login: String
    var avatarUrl: String
    var htmlUrl: String
    var name: String?
    var location: String?
    var biography: String?
    var publicRepo: Int
    var publicGists: Int
    var following: Int
    var foloowers: Int
    var createdAt: String
}
