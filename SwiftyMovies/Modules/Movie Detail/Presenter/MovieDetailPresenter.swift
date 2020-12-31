//
//  MovieDetailPresenter.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import Foundation

public final class MovieDetailPresenter: MovieDetailPresenterProtocol {
    public weak var view: MovieDetailViewProtocol?
    public let interactor: MovieDetailInteractorInputProtocol
    
    init(interactor: MovieDetailInteractorInputProtocol) {
        self.interactor = interactor
    }
}

extension MovieDetailPresenter: MovieDetailInteractorOutputProtocol {
    
    public func show(_ movieViewModel: MovieDetailViewModel) {
        view?.setMovieTitle(movieViewModel.title)
        view?.setPosterImage(movieViewModel.poster)
        view?.setIsFavorite(movieViewModel.isFavorite)
        if let overview = movieViewModel.overview {
            view?.setOverview(overview)
        }
        if let rating = movieViewModel.rating {
            view?.setRating("\(rating)")
        } else {
            view?.setRating("-")
        }
    }
}
