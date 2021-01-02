//
//  GraphQLDataFetcherFactory.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation
import Apollo

public final class GraphQLDataFetcherFactory {
    private let client: ApolloClient
    
    public init(url: URL) {
        client = ApolloClient(url: url)
    }
    
    public func makeListDataFetcher() -> GraphQLMovieListDataFetcher {
        return GraphQLMovieListDataFetcher(client: client)
    }
    
    public func makeDetailDataFetcher() -> GraphQLMovieDetailDataFetcher {
        return GraphQLMovieDetailDataFetcher(client: client)
    }
}
