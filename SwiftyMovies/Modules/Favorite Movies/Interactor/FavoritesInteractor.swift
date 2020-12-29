//
//  FavoritesInteractor.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation

class FavoritesInteractor: FavoritesInteractorInputProtocol {
    
    weak var presenter: FavoritesInteractorOutputProtocol?
    
    let dataSource: MovieDataSource
    let favoriteDataSource: FavoriteDataSource
    
    init(dataSource: MovieDataSource, favoriteDataSource: FavoriteDataSource) {
        self.dataSource = dataSource
        self.favoriteDataSource = favoriteDataSource
    }
}
