//
//  MovieFeedViewModel.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import Foundation

public struct MovieFeedViewModel: Hashable {
    public let movie: Movie
    public let isFavorite: Bool
    
    init(_ movie: Movie, isFavorite: Bool) {
        self.movie = movie
        self.isFavorite = isFavorite
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(movie)
        hasher.combine(isFavorite)
    }
}
