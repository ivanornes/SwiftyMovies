//
//  GraphQLMovieListDataFetcher.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 26/12/20.
//

import Foundation
import Apollo

public final class GraphQLMovieListDataFetcher {
    
    private let client: ApolloClient
    
    public init(client: ApolloClient) {
        self.client = client
    }

    public func getMovies(limit: Int, onCompletion: @escaping (Result<[MovieListQuery.Data.Movie.TopRated.Edge.Node], Swift.Error>)->Void) {
        let query = MovieListQuery(limit: limit)
        let _ = client.fetch(query: query, queue: DispatchQueue.global()) { result in
            switch result {
            case let .success(graphQLResult):
                let fetchedMovies = graphQLResult.data?.movies.topRated.edges?.compactMap { $0?.node } ?? []
                onCompletion(.success(fetchedMovies))
            case let .failure(error):
                onCompletion(.failure(error))
            }
        }
    }
}
