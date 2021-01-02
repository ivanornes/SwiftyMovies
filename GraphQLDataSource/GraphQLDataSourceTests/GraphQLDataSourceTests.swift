//
//  GraphQLDataSourceTests.swift
//  GraphQLDataSourceTests
//
//  Created by Ivan Ornes on 1/1/21.
//

import XCTest
@testable import GraphQLDataSource

class GraphQLDataSourceTests: XCTestCase {

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
    
    func makeSUT() -> GraphQLMovieListDataFetcher {
        let factory = GraphQLDataFetcherFactory(url: URL(string: "https://tmdb.apps.quintero.io")!)
        return factory.makeListDataFetcher()
    }
}
