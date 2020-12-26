//
//  Movie+GraphQL.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 26/12/20.
//

import Foundation

extension Movie {
    public init(_ data: MovieListQuery.Data.Movie.Popular.Edge.Node) {
        self.id = data.id
        self.title = data.title
        self.poster =  data.poster
    }
}
