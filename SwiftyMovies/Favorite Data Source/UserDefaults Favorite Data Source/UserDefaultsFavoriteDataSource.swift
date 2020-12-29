//
//  UserDefaultsFavoriteDataSource.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import Foundation

public final class UserDefaultsFavoriteDataSource: FavoriteDataSource {
    
    let userDefaults = UserDefaults()
    let key = "favorite_movies"
    
    public func isFavorite(id: Int) -> Bool {
        guard let set = userDefaults.object(forKey: key) as? [Int] else { return false }
        return set.contains(id)
    }
    
    public func setFavorite(id: Int, value: Bool) {
        if var favorites = userDefaults.object(forKey: key) as? [Int] {
            switch (favorites.contains(id), value) {
            case (false, true): favorites.append(id)
            case (true, false): favorites = favorites.filter { $0 != id }
            default: break
            }
            userDefaults.setValue(favorites, forKey: key)
        } else {
            if value {
                userDefaults.setValue([id], forKey: key)
            }
        }
    }
    
    public func getFavorites() -> [Int] {
        userDefaults.object(forKey: key) as? [Int] ?? []
    }
    
    public func resetFavorites() {
        userDefaults.removeObject(forKey: key)
    }
}
