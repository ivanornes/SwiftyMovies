//
//  MovieDetailViewModel.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import Foundation

public struct MovieDetailViewModel {
    public let title: String
    public let poster: String?
    public let isFavorite: Bool
    public let overview: String?
    public let rating: Double?
}

extension MovieDetailViewModel {
    
    init(_ movie: Movie, isFavorite: Bool) {
        self.title = movie.title
        self.poster = movie.poster
        self.overview = nil
        self.rating = nil
        self.isFavorite = isFavorite
    }
    
    init(_ detail: MovieDetail, isFavorite: Bool) {
        self.title = detail.title
        self.poster = detail.poster
        self.overview = detail.overview
        self.rating = detail.rating
        self.isFavorite = isFavorite
    }
}
