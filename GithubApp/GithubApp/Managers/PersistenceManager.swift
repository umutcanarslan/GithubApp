//
//  PersistenceManager.swift
//  GithubApp
//
//  Created by Umut Can Arslan on 5.04.2022.
//

import Foundation

enum PersistenceActionType {
    case add
    case remove
}

enum PersistenceManager {
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static private let defaults = UserDefaults.standard
    
    static func updateWith(
        favorite: Follower,
        actionType: PersistenceActionType,
        completed: @escaping(GHError?) -> Void
    ) {
        retrieveFavorites { result in
            switch result {
            case .success(var favorites):
                
                switch actionType {
                case .add:
                    guard !favorites.contains(favorite) else {
                        completed(.alreadyInFavorites)
                        return
                    }
                    favorites.append(favorite)
                case .remove:
                    favorites.removeAll { $0.login == favorite.login }
                }
                
                completed(save(favorites: favorites))
            case .failure(let error):
                completed(error)
            }
        }
    }

    static func retrieveFavorites(completed: @escaping (Result<[Follower], GHError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            completed(.success([]))
            return
        }
        do {
            let decoder = JSONDecoder()
            let favorites = try decoder.decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToDecodeFavorite))
        }
    }
    
    static func save(favorites: [Follower]) -> GHError? {
        do {
            let encoder = JSONEncoder()
            let encodedFavorites = try encoder.encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites)
            return nil
        } catch {
            return .unableToEncodeFavorite
        }
    }
    
}
