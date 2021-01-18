//
//  GraphQLMovieDetailDataFetcherTests.swift
//  GraphQLDataSourceTests
//
//  Created by Ivan Ornes on 3/1/21.
//

import XCTest
@testable import GraphQLDataSource

class GraphQLMovieDetailDataFetcherTests: XCTestCase {

    func test_GraphQLMovieDetailDataFetcher_movieDetailQueryFailsToFetchWithBadID() {
        let sut = makeSUT()
        
        let exp = expectation(description: "Wait for movie detail request")
        sut.getMovie(id: 0) { result in
            switch result {
            case .success(_): XCTFail("Error should fail to load data")
            case .failure(_): break
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
    }
    
    func test_GraphQLMovieDetailDataFetcher_fetchPulpFiction() {
        let sut = makeSUT()
        
        let exp = expectation(description: "Wait for movie detail request")
        let movieID = 680
        sut.getMovie(id: movieID) { result in
            switch result {
            case let .success(movie):
                XCTAssertEqual(movie.id, movieID)
                XCTAssertEqual(movie.title, "Pulp Fiction")
                XCTAssertEqual(movie.releaseDate, "1994-09-10T00:00:00Z")
            case let .failure(error): XCTFail("Error \(error) loading data")
            }
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 5.0)
    }
    
    // MARK: Helpers
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> GraphQLMovieDetailDataFetcher {
        let factory = GraphQLDataFetcherFactory(url: URL(string: "https://tmdb.apps.quintero.io")!)
        let fetcher = factory.makeDetailDataFetcher()
        trackForMemoryLeaks(factory, file: file, line: line)
        trackForMemoryLeaks(fetcher, file: file, line: line)
        return fetcher
    }
}
