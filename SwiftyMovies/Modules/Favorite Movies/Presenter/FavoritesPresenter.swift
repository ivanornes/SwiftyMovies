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
    
    init(view: FavoritesViewProtocol?, interactor: FavoritesInteractorInputProtocol) {
        self.view = view
        self.interactor = interactor
    }
}

extension FavoritesPresenter: FavoritesInteractorOutputProtocol {
}
