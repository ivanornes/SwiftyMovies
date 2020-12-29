//
//  GraphQLMovieDatasource.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation
import Apollo

public enum GraphQLMovieDetailDatasourceError: Error {
    case nilMovieData
}

public final class GraphQLMovieDetailDatasource: MovieDetailDataSource {
    
    private let client: ApolloClient
    
    public init(client: ApolloClient) {
        self.client = client
    }

    public func getMovie(id: Int, onCompletion: @escaping (Result<MovieDetail, Error>) -> Void) {
        let query = MovieDetailQuery(id: id)
        let _ = client.fetch(query: query) { result in
            switch result {
            case .success(let graphQLResult):
                if let movie = graphQLResult.data?.movies.movie {
                    onCompletion(.success(MovieDetail(movie)))
                } else {
                    onCompletion(.failure(GraphQLMovieDetailDatasourceError.nilMovieData))
                }
            case .failure(let error):
                onCompletion(.failure(error))
            }
        }
    }
}
