//
//  FavoritesViewControllerTests.swift
//  SwiftyMoviesTests
//
//  Created by Ivan Ornes on 29/12/20.
//

import XCTest
@testable import SwiftyMovies

class FavoritesViewControllerTests: XCTestCase {
    
    // MARK: Favorites storyboard
    
    func test_favoritesViewController_isFavoritesViewController() {
        XCTAssertTrue(makeFavoritesStoryboard().instantiateInitialViewController() is FavoritesViewController)
    }
    
    // MARK: Helpers
    
    func makeFavoritesStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Favorites", bundle: nil)
    }
}
