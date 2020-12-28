//
//  FavoriteDataSource.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import Foundation

public protocol FavoriteDataSource {
    func isFavorite(id: Int) -> Bool
    func setFavorite(id: Int, value: Bool)
}
