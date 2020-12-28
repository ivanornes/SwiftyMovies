//
//  MovieDetailProtocols.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import Foundation

public protocol MovieDetailViewProtocol: class {
    func setTitle(_ title: String)
    func setPosterImage(_ poster: String?)
    func setIsFavorite(_ isFavorite: Bool)
}

public protocol MovieDetailPresenterProtocol: class {
}

public protocol MovieDetailInteractorInputProtocol: class {
}

public protocol MovieDetailInteractorOutputProtocol: class {
    func show(_ movieViewModel: MovieDetailViewModel)
}
