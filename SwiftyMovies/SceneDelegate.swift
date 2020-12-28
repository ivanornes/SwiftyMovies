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
        let url = URL(string: "https://tmdb.apps.quintero.io")!
        return GraphQLMovieDataSourceFactory.makeDataSource(url: url)
    }()
    
    private lazy var navigationController = UINavigationController(rootViewController: MovieFeedWireframe.composeUIWith(dataSource: dataSource))
    
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

