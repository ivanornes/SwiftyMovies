//
//  GraphQLMovieDatasource.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 26/12/20.
//

import Foundation
import Apollo

public final class GraphQLMovieDatasource: MovieDataSource {
    
    private let client: ApolloClient
    
    public init(client: ApolloClient) {
        self.client = client
    }
    
    public func getMovies(onCompletion: @escaping (Result<[Movie], Swift.Error>)->Void) {
        var movieList: [SwiftyMovies.MovieListQuery.Data.Movie.Popular.Edge.Node] = []
        let query = MovieListQuery()
        let _ = client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                let fetchedMovies = graphQLResult.data?.movies.popular.edges?.compactMap { $0?.node } ?? []
                movieList.append(contentsOf: fetchedMovies)
                onCompletion(.success(movieList.map(Movie.init)))
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
}
