//
//  MovieFeedWireframe.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import UIKit

public final class MovieFeedWireframe {
    private init() {}
    
    public static func composeUIWith(dataSource: MovieDataSource, selection: @escaping (Movie) -> Void) -> UIViewController {
        let vc = makeMovieFeedViewController(title: "Swifty Movies")
        let interactor = MovieFeedInteractor(dataSource: dataSource)
        let presenter = MovieFeedPresenter(view: vc, interactor: interactor, selection: selection)
        vc.presenter = presenter
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
