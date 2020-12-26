//
//  SwiftyMoviesTests.swift
//  SwiftyMoviesTests
//
//  Created by Ivan Ornes on 26/12/20.
//

import XCTest
import Apollo
@testable import SwiftyMovies

class NetworkTransport {
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://tmdb.apps.quintero.io")!)
}

class SwiftyMoviesTests: XCTestCase {

    func test_NetworkTransport_movieListQueryReturnsData() {
        let sut = NetworkTransport()
        let query = MovieListQuery()
        let exp = expectation(description: "Fetch result")
        let _ = sut.apollo.fetch(query: query) { result in
            switch result {
            case .success(let queryResult):
                XCTAssertNotNil(queryResult.data)
                XCTAssertNil(queryResult.errors)
                break
            case .failure(let error): XCTFail("Error \(error.localizedDescription) loading movies data")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 3.0)
    }
}
