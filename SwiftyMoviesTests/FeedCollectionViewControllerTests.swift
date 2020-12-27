//
//  FeedCollectionViewControllerTests.swift
//  SwiftyMoviesTests
//
//  Created by Ivan Ornes on 27/12/20.
//

import XCTest
@testable import SwiftyMovies

class FeedCollectionViewControllerTests: XCTestCase {
    
    // MARK: Feed collection storyboard
    
    func test_feedCollectionViewController_isFeedCollectionViewController() {
        XCTAssertTrue(makeFeedStoryboard().instantiateInitialViewController() is FeedCollectionViewController)
    }
    
    // MARK: Helpers
    
    func makeFeedStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Feed", bundle: nil)
    }
    
    func makeFeedCollectionViewController(storyboard: UIStoryboard) -> FeedCollectionViewController {
        let vc = storyboard.instantiateInitialViewController() as! FeedCollectionViewController
        _ = vc.view
        return vc
    }
}
