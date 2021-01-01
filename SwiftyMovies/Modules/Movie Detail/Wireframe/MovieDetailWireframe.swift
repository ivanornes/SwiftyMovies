//
//  MovieDetailWireframe.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import UIKit

public final class MovieDetailWireframe {
    private init() {}
    
    public static func composeUIWith(movie: Movie,
                                     movieDetailDataSource: MovieDetailDataSource,
                                     favoriteDataSource: FavoriteDataSource) -> UIViewController {
        let vc = makeMovieDetailViewController(title: movie.title)
        let interactor = MovieDetailInteractor(movie: movie,
                                               movieDetailDataSource: movieDetailDataSource,
                                               favoriteDataSource: favoriteDataSource)
        let presenter = MovieDetailPresenter(interactor: interactor)
        presenter.view = vc
        vc.presenter = presenter
        interactor.presenter = presenter
        vc.refreshData = interactor.loadData
        vc.toggleFavorite = interactor.toggleFavorite
        return vc
    }
    
    private static func makeMovieDetailViewController(title: String) -> MovieDetailViewController {
        let detailController = MovieDetailViewController.instantiateInitialViewController(from: "Detail")
        detailController.title = title
        return detailController
    }
}
