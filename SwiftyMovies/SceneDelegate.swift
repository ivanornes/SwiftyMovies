//
//  SceneDelegate.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 26/12/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private lazy var dataSourceFactory: GraphQLDataSourceFactory = {
        #if DEBUG
        let url = URL(string: "http://127.0.0.1:8080")!
        #else
        let url = URL(string: "https://tmdb.apps.quintero.io")!
        #endif
        return GraphQLDataSourceFactory(url: url)
    }()
    
    private lazy var listDataSource: MovieListDataSource = {
        dataSourceFactory.makeListDataSource()
    }()
    
    private lazy var detailDataSource: MovieDetailDataSource = {
        dataSourceFactory.makeDetailDataSource()
    }()
    
    private lazy var favoriteDataSource: FavoriteDataSource = {
        UserDefaultsFavoriteDataSource()
    }()
    
    private lazy var navigationController = MoviesNavigationController(rootViewController: MovieFeedWireframe.composeUIWith(listDataSource: listDataSource, favoriteDataSource: favoriteDataSource) { movie in
        self.showMovieDetail(for: movie)
    } showFavorites: {
        self.showFavorites()
    })
    
    private func showMovieDetail(for movie: Movie) {
        let movieDetail = MovieDetailWireframe.composeUIWith(movie: movie,
                                                             movieDetailDataSource: detailDataSource,
                                                             favoriteDataSource: favoriteDataSource)
        navigationController.pushViewController(movieDetail, animated: true)
    }
    
    private func showFavorites() {
        let favorites = FavoritesWireframe.composeUIWith(listDataSource: listDataSource,
                                                         detailDataSource: detailDataSource,
                                                         favoriteDataSource: favoriteDataSource) { movie in
            self.showMovieDetail(for: movie)
        }
        navigationController.pushViewController(favorites, animated: true)
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: scene)
        configureWindow()
    }
    
    func configureWindow() {
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

