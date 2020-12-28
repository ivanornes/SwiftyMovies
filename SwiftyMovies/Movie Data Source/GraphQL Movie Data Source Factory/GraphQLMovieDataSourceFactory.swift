//
//  GraphQLMovieDataSourceFactory.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import Foundation
import Apollo

struct GraphQLMovieDataSourceFactory {
    static func makeDataSource(url: URL) -> MovieDataSource {
        let client = ApolloClient(url: url)
        return GraphQLMovieDatasource(client: client)
    }
}
