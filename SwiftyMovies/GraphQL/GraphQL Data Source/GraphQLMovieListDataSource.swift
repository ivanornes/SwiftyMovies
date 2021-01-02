//
//  GraphQLMovieListDataSource.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 1/1/21.
//

import Foundation
import GraphQLDataSource

public final class GraphQLMovieListDataSource: MovieListDataSource {

    private let fetcher: GraphQLMovieListDataFetcher

    public init(fetcher: GraphQLMovieListDataFetcher) {
        self.fetcher = fetcher
    }

    public func getMovies(limit: Int, onCompletion: @escaping (Result<[Movie], Swift.Error>)->Void) {
        fetcher.getMovies(limit: limit) { result in
            switch result {
            case .success(let movies): onCompletion(.success(movies.map(Movie.init)))
            case .failure(let error): onCompletion(.failure(error))
            }
        }
    }
}
