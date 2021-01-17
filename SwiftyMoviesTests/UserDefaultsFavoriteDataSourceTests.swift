//
//  UserDefaultsFavoriteDataSourceTests.swift
//  SwiftyMoviesTests
//
//  Created by Ivan Ornes on 29/12/20.
//

import XCTest
@testable import SwiftyMovies

class UserDefaultsFavoriteDataSourceTests: XCTestCase {
    
    // MARK: Favorites Data Source

    override class func setUp() {
        let sut: FavoriteDataSource = UserDefaultsFavoriteDataSource()
        sut.resetFavorites()
    }
    
    func test_setFavorite_setIDAsFavorite() {
        let sut = makeSUT()
        
        sut.setFavorite(id: 1, value: true)
        sut.setFavorite(id: 2, value: false)
        
        XCTAssertTrue(sut.isFavorite(id: 1))
        XCTAssertFalse(sut.isFavorite(id: 2))
    }

    func test_setFavorite_checkNoDuplicatedIDs() {
        let sut = makeSUT()
        
        sut.setFavorite(id: 1, value: true)
        sut.setFavorite(id: 1, value: true)
        
        XCTAssertTrue(sut.getFavorites().count == 1)
    }

    func test_setFavorite_checkDoesNotAddFalseValue() {
        let sut = makeSUT()
        
        sut.setFavorite(id: 1, value: true)
        sut.setFavorite(id: 2, value: false)
        
        XCTAssertTrue(sut.getFavorites().count == 1)
    }

    func test_setFavorite_checkAddRemove() {
        let sut = makeSUT()
        
        sut.setFavorite(id: 1, value: true)
        sut.setFavorite(id: 1, value: false)
        
        XCTAssertTrue(sut.getFavorites().count == 0)
    }
    
    func test_setFavorite_checkAddRemoveAdd() {
        let sut = makeSUT()
        
        sut.setFavorite(id: 1, value: true)
        sut.setFavorite(id: 1, value: false)
        sut.setFavorite(id: 1, value: true)
        
        XCTAssertTrue(sut.getFavorites().count == 1)
    }
    
    func test_getFavorites_getsAllFavorites() {
        let sut = makeSUT()
        
        sut.setFavorite(id: 1, value: true)
        sut.setFavorite(id: 2, value: false)
        
        XCTAssertTrue(sut.getFavorites().contains(1))
        XCTAssertFalse(sut.getFavorites().contains(2))
    }
    
    func test_reset_checkAllfavoritesHaveBeenRemoved() {
        let sut = makeSUT()
        
        sut.setFavorite(id: 1, value: true)
        sut.setFavorite(id: 2, value: false)
        
        sut.resetFavorites()
        XCTAssertTrue(sut.getFavorites().isEmpty)
    }
    
    // MARK: Helpers
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> FavoriteDataSource {
        let dataSource = UserDefaultsFavoriteDataSource()
        trackForMemoryLeaks(dataSource, file: file, line: line)
        return dataSource
    }
}
