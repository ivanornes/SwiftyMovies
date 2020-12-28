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
    
    public init(view: MovieFeedViewProtocol, interactor: MovieFeedInteractorInputProtocol, selection: @escaping (Movie) -> Void) {
        self.view = view
        self.interactor = interactor
        self.selection = selection
    }
    
    public func reloadData() {
        interactor.loadMovies()
    }
}

extension MovieFeedPresenter: MovieFeedInteractorOutputProtocol {
    public func show(_ movies: [Movie]) {
        view?.show(movies.map { movie in
            CellController(id: movie,
                           MovieFeedCellController(model: movie,
                                                   selection: selection))
        })
    }
}
