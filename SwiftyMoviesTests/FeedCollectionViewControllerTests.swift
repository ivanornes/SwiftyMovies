//
//  MovieFeedViewControllerTests.swift
//  SwiftyMoviesTests
//
//  Created by Ivan Ornes on 27/12/20.
//

import XCTest
@testable import SwiftyMovies

class MovieFeedViewControllerTests: XCTestCase {
    
    // MARK: Feed collection storyboard
    
    func test_movieFeedViewController_isFeedCollectionViewController() {
        XCTAssertTrue(makeFeedStoryboard().instantiateInitialViewController() is MovieFeedViewController)
    }
    
    // MARK: Helpers
    
    func makeFeedStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Feed", bundle: nil)
    }
    
    func makeMovieFeedViewController(storyboard: UIStoryboard) -> MovieFeedViewController {
        let vc = storyboard.instantiateInitialViewController() as! MovieFeedViewController
        _ = vc.view
        return vc
    }
}
