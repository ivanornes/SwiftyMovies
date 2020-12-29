//
//  FavoritesInteractor.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation

class FavoritesInteractor: FavoritesInteractorInputProtocol {
    
    weak var presenter: FavoritesInteractorOutputProtocol?
    
    let listDataSource: MovieListDataSource
    let favoriteDataSource: FavoriteDataSource
    
    init(listDataSource: MovieListDataSource, favoriteDataSource: FavoriteDataSource) {
        self.listDataSource = listDataSource
        self.favoriteDataSource = favoriteDataSource
    }
    
    func loadMovies() {
        favoriteDataSource.getFavorites()
    }
}
