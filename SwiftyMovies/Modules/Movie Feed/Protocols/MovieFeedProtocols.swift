//
//  MovieFeedProtocols.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import Foundation

public protocol MovieFeedViewProtocol: class {
    func show(_ sections: [CellController]...)
    func showError()
}

public protocol MovieFeedPresenterProtocol: class {
}

public protocol MovieFeedInteractorInputProtocol: class {
}

public protocol MovieFeedInteractorOutputProtocol: class {
    func show(_ movies: [Movie])
    func showError()
}
