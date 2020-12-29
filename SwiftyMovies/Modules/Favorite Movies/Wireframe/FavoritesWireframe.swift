//
//  FavoritesWireframe.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import UIKit

public final class FavoritesWireframe {
    private init() {}
    
    public static func composeUIWith(listDataSource: MovieListDataSource,
                                     favoriteDataSource: FavoriteDataSource,
                                     selection: @escaping (Movie) -> Void) -> UIViewController {
        let vc = makeFavoritesViewController(title: "Favorite Movies")
        let interactor = FavoritesInteractor(listDataSource: listDataSource, favoriteDataSource: favoriteDataSource)
        let presenter = FavoritesPresenter(view: vc,
                                           interactor: interactor,
                                           selection: selection,
                                           favoriteDataSource: favoriteDataSource)
        vc.presenter = presenter
        vc.reloadData = interactor.loadMovies
        interactor.presenter = presenter
        return vc
    }
    
    private static func makeFavoritesViewController(title: String) -> FavoritesViewController {
        let bundle = Bundle(for: MovieFeedViewController.self)
        let storyboard = UIStoryboard(name: "Favorites", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FavoritesViewController
        feedController.title = title
        return feedController
    }
}
