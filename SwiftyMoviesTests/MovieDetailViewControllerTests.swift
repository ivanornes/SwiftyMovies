//
//  MovieDetailViewControllerTests.swift
//  SwiftyMoviesTests
//
//  Created by Ivan Ornes on 28/12/20.
//

import XCTest
@testable import SwiftyMovies

class MovieDetailViewControllerTests: XCTestCase {
    
    // MARK: Feed collection storyboard
    
    func test_movieDetailViewController_isFeedCollectionViewController() {
        XCTAssertTrue(makeMovieDetailStoryboard().instantiateInitialViewController() is MovieDetailViewController)
    }
    
    // MARK: Helpers
    
    func makeMovieDetailStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Detail", bundle: nil)
    }
    
    func makeMovieDetailViewController(storyboard: UIStoryboard) -> MovieDetailViewController {
        let vc = storyboard.instantiateInitialViewController() as! MovieDetailViewController
        _ = vc.view
        return vc
    }
}
