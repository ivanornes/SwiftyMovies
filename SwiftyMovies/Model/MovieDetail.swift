//
//  MovieDetail.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation

public struct MovieDetail {
    public let id: Int
    public let title: String
    public let poster: String?
    public let overview: String
    public let rating: Double
    public let releaseDate: String?
}

extension MovieDetail {
    public var posterURL: URL? {
        guard let poster = poster else { return nil }
        return URL(string: poster)
    }
}

extension MovieDetail {
    var movie: Movie {
        .init(id: id,
              title: title,
              poster: poster,
              releaseDate: releaseDate)
    }
}
