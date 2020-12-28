//
//  UserDefaultsFavoriteDataSource.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import Foundation

public final class UserDefaultsFavoriteDataSource: FavoriteDataSource {
    
    let userDefaults = UserDefaults()
    
    public func isFavorite(id: Int) -> Bool {
        userDefaults.bool(forKey: String(id))
    }
    
    public func setFavorite(id: Int, value: Bool) {
        userDefaults.setValue(value, forKey: String(id))
    }
}
