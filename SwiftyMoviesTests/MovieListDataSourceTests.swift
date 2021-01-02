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

    func test_NetworkTransport_movieListQueryReturnsData() {
        let sut = makeSUT()
        
        let exp = expectation(description: "Wait for movie list request")
        let limit = 10
        sut.getMovies(limit: limit) { result in
            switch result {
            case .success(let movies): XCTAssertTrue(movies.count == limit)
            case .failure(let error): XCTFail("Error \(error.localizedDescription) loading movies data")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    // MARK: Helpers
    
    func makeSUT() -> MovieListDataSource {
        let factory = GraphQLDataFetcherFactory(url: APIHost.production)
        return GraphQLMovieListDataSource(fetcher: factory.makeListDataFetcher())
    }
}
