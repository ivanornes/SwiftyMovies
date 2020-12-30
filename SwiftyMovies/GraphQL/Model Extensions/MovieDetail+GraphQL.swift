//
//  MovieDetail+GraphQL.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation

extension MovieDetail {

    public init(_ data: MovieDetailQuery.Data.Movie.Movie) {
        self.id = data.id
        self.title = data.title
        self.poster = data.poster
        self.overview = data.details.overview
        self.rating = data.rating
        self.releaseDate = data.releaseDate
    }
}
