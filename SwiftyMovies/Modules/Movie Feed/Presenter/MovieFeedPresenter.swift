//
//  MovieFeedPresenter.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import Foundation

public final class MovieFeedPresenter: MovieFeedPresenterProtocol {
    
    private weak var view: MovieFeedViewProtocol?
    private let interactor: MovieFeedInteractorInputProtocol
    private let selection: (Movie) -> Void
    private let favoriteDataSource: FavoriteDataSource
    
    public init(view: MovieFeedViewProtocol,
                interactor: MovieFeedInteractorInputProtocol,
                selection: @escaping (Movie) -> Void,
                favoriteDataSource: FavoriteDataSource) {
        self.view = view
        self.interactor = interactor
        self.selection = selection
        self.favoriteDataSource = favoriteDataSource
    }
}

extension MovieFeedPresenter: MovieFeedInteractorOutputProtocol {
    public func show(_ movies: [Movie]) {
        view?.show(movies.map {
            let isFavorite = favoriteDataSource.isFavorite(id: $0.id)
            return CollectionCellController(id: MovieFeedViewModel($0, isFavorite: isFavorite),
                           MovieFeedCellController(model: $0,
                                                   favoriteDataSource: favoriteDataSource,
                                                           selection: selection))
        })
    }
    
    public func showError() {
        view?.showError()
    }
}
