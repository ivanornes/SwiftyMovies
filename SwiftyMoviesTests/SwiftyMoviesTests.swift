//
//  SwiftyMoviesTests.swift
//  SwiftyMoviesTests
//
//  Created by Ivan Ornes on 26/12/20.
//

import XCTest
import Apollo
@testable import SwiftyMovies

struct Movie {
    let id: Int
    let title: String
    let poster: String?
}

extension Movie {
    init(_ data: MovieListQuery.Data.Movie.Popular.Edge.Node) {
        self.id = data.id
        self.title = data.title
        self.poster =  data.poster
    }
}

protocol MovieDataSource {
    func getMovies(onCompletion: @escaping (Result<[Movie], Swift.Error>)->Void)
}

class GraphQLMovieDatasource: MovieDataSource {
    
    let client: ApolloClient
    
    init(client: ApolloClient) {
        self.client = client
    }
    
    func getMovies(onCompletion: @escaping (Result<[Movie], Swift.Error>)->Void) {
        var movieList: [SwiftyMovies.MovieListQuery.Data.Movie.Popular.Edge.Node] = []
        let query = MovieListQuery()
        let _ = client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                XCTAssertNotNil(graphQLResult.data)
                XCTAssertNil(graphQLResult.errors)
                let fetchedMovies = graphQLResult.data?.movies.popular.edges?.compactMap { $0?.node } ?? []
                movieList.append(contentsOf: fetchedMovies)
                onCompletion(.success(movieList.map(Movie.init)))
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
}

class SwiftyMoviesTests: XCTestCase {

    func test_NetworkTransport_movieListQueryReturnsData() {
        let sut = makeSUT()
        
        let exp = expectation(description: "Wait for movie list request")
        sut.getMovies { result in
            switch result {
            case .success(let movies): XCTAssertTrue(!movies.isEmpty)
            case .failure(let error): XCTFail("Error \(error.localizedDescription) loading movies data")
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 5.0)
    }
    
    // MARK: Helpers
    
    func makeSUT() -> MovieDataSource {
        let apollo = ApolloClient(url: URL(string: "https://tmdb.apps.quintero.io")!)
        return GraphQLMovieDatasource.init(client: apollo)
    }
}
