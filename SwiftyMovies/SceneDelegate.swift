//
//  SceneDelegate.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 26/12/20.
//

import UIKit

struct UIComposer {
    static func movieListView() -> UIViewController {
        let viewController = UIViewController()
        return viewController
    }
}

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    private lazy var navigationController = UINavigationController(rootViewController: UIComposer.movieListView())
    
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

