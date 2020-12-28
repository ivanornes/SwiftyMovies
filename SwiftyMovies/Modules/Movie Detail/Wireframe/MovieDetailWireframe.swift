//
//  MovieDetailWireframe.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import UIKit

public final class MovieDetailWireframe {
    private init() {}
    
    public static func composeUIWith(movie: Movie, dataSource: MovieDataSource) -> UIViewController {
        let vc = makeMovieDetailViewController(title: movie.title)
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
