//
//  Movie.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 26/12/20.
//

import Foundation

public struct Movie {
    public let id: Int
    public let title: String
    public let poster: String?
}

extension Movie {
    public var posterURL: URL? {
        guard let poster = poster else { return nil }
        return URL(string: poster)
    }
}

extension Movie: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(title)
    }
}
