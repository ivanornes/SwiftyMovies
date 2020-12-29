//
//  FavoritesWireframe.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import UIKit

public final class FavoritesWireframe {
    private init() {}
    
    public static func composeUIWith(dataSource: MovieDataSource,
                                     favoriteDataSource: FavoriteDataSource,
                                     selection: @escaping (Movie) -> Void) -> UIViewController {
        let vc = makeFavoritesViewController(title: "Favorite Movies")
        let interactor = FavoritesInteractor(dataSource: dataSource, favoriteDataSource: favoriteDataSource)
        let presenter = FavoritesPresenter(view: vc, interactor: interactor)
        vc.presenter = presenter
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
