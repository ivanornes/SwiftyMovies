//
//  GraphQLDataSourceFactory.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation
import Apollo

class GraphQLDataSourceFactory {
    let client: ApolloClient
    
    init(url: URL) {
        client = ApolloClient(url: url)
    }
    
    func makeListDataSource() -> MovieListDataSource {
        return GraphQLMovieListDatasource(client: client)
    }
    
    func makeDetailDataSource() -> MovieDetailDataSource {
        return GraphQLMovieDetailDatasource(client: client)
    }
}
