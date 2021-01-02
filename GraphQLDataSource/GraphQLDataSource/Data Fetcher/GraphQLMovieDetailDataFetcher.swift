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
        let _ = client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let movie = graphQLResult.data?.movies.movie {
                    onCompletion(.success(movie))
                } else {
                    onCompletion(.failure(GraphQLMovieDetailDataFetcherError.nilMovieData))
                }
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
}
