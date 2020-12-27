//
//  MovieFeedProtocols.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import Foundation

public protocol MovieFeedViewProtocol: class {
    func show(_ sections: [CellController]...)
}

public protocol MovieFeedPresenterProtocol: class {
    func reloadData()
}

public protocol MovieFeedInteractorInputProtocol: class {
    func loadMovies()
}

public protocol MovieFeedInteractorOutputProtocol: class {
    func show(_ movies: [Movie])
}
