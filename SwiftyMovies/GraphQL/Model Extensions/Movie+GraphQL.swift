//
//  Movie+GraphQL.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 26/12/20.
//

import Foundation
import GraphQLDataSource

extension Movie {
    public init(_ data: MovieListQuery.Data.Movie.TopRated.Edge.Node) {
        self.id = data.id
        self.title = data.title
        self.poster = data.poster
        self.releaseDate = data.releaseDate
    }
    
    public init(_ data: MovieDetailQuery.Data.Movie.Movie) {
        self.id = data.id
        self.title = data.title
        self.poster = data.poster
        self.releaseDate = data.releaseDate
    }
}
