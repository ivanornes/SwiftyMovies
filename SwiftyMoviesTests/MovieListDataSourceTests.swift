//
//  MovieListDataSourceTests.swift
//  MovieListDataSourceTests
//
//  Created by Ivan Ornes on 26/12/20.
//

import XCTest
import GraphQLDataSource
@testable import SwiftyMovies

class MovieListDataSourceTests: XCTestCase {

    func test_MovieListDataSource_movieListQueryReturnsData() {
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
        wait(for: [exp], timeout: 10.0)
    }
    
    // MARK: Helpers
    
    func makeSUT(file: StaticString = #file, line: UInt = #line) -> MovieListDataSource {
        let factory = GraphQLDataFetcherFactory(url: APIHost.production)
        let dataSource = GraphQLMovieListDataSource(fetcher: factory.makeListDataFetcher())
        trackForMemoryLeaks(factory, file: file, line: line)
        trackForMemoryLeaks(dataSource, file: file, line: line)
        return dataSource
    }
}
