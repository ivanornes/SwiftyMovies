//
//  FavoritesPresenter.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation

public final class FavoritesPresenter: FavoritesPresenterProtocol {
    
    private weak var view: FavoritesViewProtocol?
    private let interactor: FavoritesInteractorInputProtocol
    private let selection: (Movie) -> Void
    private let favoriteDataSource: FavoriteDataSource
    
    init(view: FavoritesViewProtocol?, interactor: FavoritesInteractorInputProtocol, selection: @escaping (Movie) -> Void, favoriteDataSource: FavoriteDataSource) {
        self.view = view
        self.interactor = interactor
        self.selection = selection
        self.favoriteDataSource = favoriteDataSource
    }
}

extension FavoritesPresenter: FavoritesInteractorOutputProtocol {
    
    public func show(_ movies: [Movie]) {
        view?.show(movies.map {
            let isFavorite = favoriteDataSource.isFavorite(id: $0.id)
            return TableCellController(id: MovieFeedViewModel($0, isFavorite: isFavorite),
                           FavoritesCellController(model: $0,
                                                   favoriteDataSource: favoriteDataSource,
                                                           selection: selection))
        })
    }
}
