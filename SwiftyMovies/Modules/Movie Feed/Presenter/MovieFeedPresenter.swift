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
}

extension MovieFeedPresenter: MovieFeedInteractorOutputProtocol {
    public func show(_ movies: [Movie]) {
        view?.show(movies.map {
            CellController(id: $0, MovieFeedCellController(model: $0, selection: selection))
        })
    }
    
    public func showError() {
        view?.showError()
    }
}
