//
//  SceneDelegate.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 26/12/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private lazy var dataSource: MovieDataSource = {
        #if DEBUG
        let url = URL(string: "http://127.0.0.1:8080")!
        #else
        let url = URL(string: "https://tmdb.apps.quintero.io")!
        #endif
        return GraphQLMovieDataSourceFactory.makeDataSource(url: url)
    }()
    
    private lazy var favoriteDataSource: FavoriteDataSource = {
        UserDefaultsFavoriteDataSource()
    }()
    
    private func showMovieDetail(for movie: Movie) {
        let movieDetail = MovieDetailWireframe.composeUIWith(movie: movie, dataSource: dataSource)
        navigationController.pushViewController(movieDetail, animated: true)
    }
    
    private lazy var navigationController = UINavigationController(rootViewController: MovieFeedWireframe.composeUIWith(dataSource: dataSource, favoriteDataSource: favoriteDataSource) { movie in
        self.showMovieDetail(for: movie)
    })
    
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

