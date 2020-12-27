//
//  UIComposer.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import UIKit

public final class UIComposer {
    private init() {}
    
    public static func composeUIWith() -> UIViewController {
        makeMovieCollectionViewController(title: "Swifty Movies")
    }
    
    private static func makeMovieCollectionViewController(title: String) -> FeedCollectionViewController {
        let bundle = Bundle(for: FeedCollectionViewController.self)
        let storyboard = UIStoryboard(name: "Feed", bundle: bundle)
        let feedController = storyboard.instantiateInitialViewController() as! FeedCollectionViewController
        feedController.title = title
        return feedController
    }
}
