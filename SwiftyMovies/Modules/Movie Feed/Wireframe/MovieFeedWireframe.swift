//
//  MovieFeedWireframe.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import UIKit

public final class MovieFeedWireframe {
    private init() {}
    
    public static func composeUIWith(listDataSource: MovieListDataSource,
                                     favoriteDataSource: FavoriteDataSource,
                                     selection: @escaping (Movie) -> Void,
                                     showFavorites: @escaping () -> Void) -> UIViewController {
        let vc = makeMovieFeedViewController(title: "Swifty Movies")
        let interactor = MovieFeedInteractor(listDataSource: listDataSource)
        let presenter = MovieFeedPresenter(view: vc,
                                           interactor: interactor,
                                           selection: selection,
                                           favoriteDataSource: favoriteDataSource)
        vc.presenter = presenter
        vc.reloadData = interactor.loadMovies
        vc.loadNextPage = interactor.loadNextPage
        vc.showFavorites = showFavorites
        interactor.presenter = presenter
        return vc
    }
    
    private static func makeMovieFeedViewController(title: String) -> MovieFeedViewController {
        let bundle = Bundle(for: MovieFeedViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! MovieFeedViewController
        feedController.title = title
        return feedController
    }
}
