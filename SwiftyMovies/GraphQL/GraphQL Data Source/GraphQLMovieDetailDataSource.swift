//
//  GraphQLMovieDetailDataSource.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 1/1/21.
//

import Foundation
import GraphQLDataSource

public final class GraphQLMovieDetailDataSource: MovieDetailDataSource {

    private let fetcher: GraphQLMovieDetailDataFetcher

    public init(fetcher: GraphQLMovieDetailDataFetcher) {
        self.fetcher = fetcher
    }

    public func getMovie(id: Int, onCompletion: @escaping (Result<MovieDetail, Error>) -> Void) {
        fetcher.getMovie(id: id) { result in
            switch result {
            case .success(let movie): onCompletion(.success(MovieDetail(movie)))
            case .failure(let error): onCompletion(.failure(error))
            }
        }
    }
}
