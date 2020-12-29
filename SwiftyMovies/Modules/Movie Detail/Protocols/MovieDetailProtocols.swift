//
//  MovieDetailProtocols.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import Foundation

public protocol MovieDetailViewProtocol: class {
    func setMovieTitle(_ title: String)
    func setPosterImage(_ poster: String?)
    func setIsFavorite(_ isFavorite: Bool)
    func setOverview(_ overview: String)
    func setRating(_ rating: String)
}

public protocol MovieDetailPresenterProtocol: class {
}

public protocol MovieDetailInteractorInputProtocol: class {
}

public protocol MovieDetailInteractorOutputProtocol: class {
    func show(_ movieViewModel: MovieDetailViewModel)
}
