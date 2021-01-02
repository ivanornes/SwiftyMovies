//
//  MovieDetailViewControllerTests.swift
//  SwiftyMoviesTests
//
//  Created by Ivan Ornes on 28/12/20.
//

import XCTest
@testable import SwiftyMovies

class MovieDetailViewControllerTests: XCTestCase {
    
    // MARK: Movie detail storyboard
    
    func test_movieDetailViewController_isMovieDetailViewController() {
        XCTAssertTrue(makeMovieDetailStoryboard().instantiateInitialViewController() is MovieDetailViewController)
    }
    
    // MARK: Helpers
    
    func makeMovieDetailStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Detail", bundle: nil)
    }
}
