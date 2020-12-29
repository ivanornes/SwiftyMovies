//
//  FavoritesProtocols.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation

public protocol FavoritesViewProtocol: class {
    func show(_ sections: [TableCellController]...)
}

public protocol FavoritesPresenterProtocol: class {
}

public protocol FavoritesInteractorInputProtocol: class {
    func toggledFavorite(_ movie: Movie)
}

public protocol FavoritesInteractorOutputProtocol: class {
    func show(_ movies: [Movie])
}
