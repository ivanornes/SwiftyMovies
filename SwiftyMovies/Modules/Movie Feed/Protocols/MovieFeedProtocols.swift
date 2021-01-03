//
//  MovieFeedProtocols.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import Foundation

public protocol MovieFeedViewProtocol: class {
    func show(_ sections: [CollectionCellController]...)
    func showError()
}

public protocol MovieFeedPresenterProtocol: class {
}

public protocol MovieFeedInteractorInputProtocol: class {
    func loadMovies()
    func loadNextPage()
    func unlockNextPageLoadRequests()
}

public protocol MovieFeedInteractorOutputProtocol: class {
    func show(_ movies: [Movie])
    func showError()
}
