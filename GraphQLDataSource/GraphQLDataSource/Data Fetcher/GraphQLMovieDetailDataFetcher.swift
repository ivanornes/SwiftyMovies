//
//  GraphQLMovieDetailDataFetcher.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation
import Apollo

public enum GraphQLMovieDetailDataFetcherError: Error {
    case nilMovieData
}

public final class GraphQLMovieDetailDataFetcher {
    
    private let client: ApolloClient
    
    public init(client: ApolloClient) {
        self.client = client
    }

    public func getMovie(id: Int, onCompletion: @escaping (Result<MovieDetailQuery.Data.Movie.Movie, Error>) -> Void) {
        let query = MovieDetailQuery(id: id)
        _ = client.fetch(query: query) { result in
            switch result {
            case let .success(graphQLResult):
                if let movie = graphQLResult.data?.movies.movie {
                    onCompletion(.success(movie))
                } else {
                    onCompletion(.failure(GraphQLMovieDetailDataFetcherError.nilMovieData))
                }
            case let .failure(error):
                onCompletion(.failure(error))
            }
        }
    }
}
