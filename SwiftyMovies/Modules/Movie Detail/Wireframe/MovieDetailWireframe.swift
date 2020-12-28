//
//  MovieDetailWireframe.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import UIKit

public final class MovieDetailWireframe {
    private init() {}
    
    public static func composeUIWith(movie: Movie, favoriteDataSource: FavoriteDataSource) -> UIViewController {
        let vc = makeMovieDetailViewController(title: movie.title)
        let interactor = MovieDetailInteractor(movie: movie, favoriteDataSource: favoriteDataSource)
        let presenter = MovieDetailPresenter(interactor: interactor)
        presenter.view = vc
        vc.presenter = presenter
        interactor.presenter = presenter
        vc.refreshData = interactor.loadData
        vc.toggleFavorite = interactor.toggleFavorite
        return vc
    }
    
    private static func makeMovieDetailViewController(title: String) -> MovieDetailViewController {
        let bundle = Bundle(for: MovieFeedViewController.self)
        let storyboard = UIStoryboard(name: "Detail", bundle: bundle)
        let detailController = storyboard.instantiateInitialViewController() as! MovieDetailViewController
        detailController.title = title
        return detailController
    }
}
