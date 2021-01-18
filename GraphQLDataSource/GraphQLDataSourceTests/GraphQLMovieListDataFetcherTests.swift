//
//  GraphQLMovieListDataFetcherTests.swift
//  GraphQLDataSourceTests
//
//  Created by Ivan Ornes on 1/1/21.
//

import XCTest
@testable import GraphQLDataSource

class GraphQLMovieListDataFetcherTests: XCTestCase {

    func test_GraphQLMovieListDataFetcher_movieListQueryReturnsData() {
        let sut = makeSUT()
        
        let exp = expectation(description: "Wait for movie list request")
        let limit = 10
        sut.getMovies(limit: limit) { result in
            switch result {
            case let .success(movies): XCTAssertTrue(movies.count == limit)
            case let .failure(error): XCTFail("Error \(error.localizedDescription) loading movies data")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    // MARK: Helpers
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> GraphQLMovieListDataFetcher {
        let factory = GraphQLDataFetcherFactory(url: URL(string: "https://tmdb.apps.quintero.io")!)
        let fetcher = factory.makeListDataFetcher()
        trackForMemoryLeaks(factory, file: file, line: line)
        trackForMemoryLeaks(fetcher, file: file, line: line)
        return fetcher
    }
}
