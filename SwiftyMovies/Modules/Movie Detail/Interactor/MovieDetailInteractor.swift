//
//  MovieDetailInteractor.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import Foundation

public final class MovieDetailInteractor: MovieDetailInteractorInputProtocol {
    public weak var presenter: MovieDetailInteractorOutputProtocol?
    
    let movie: Movie
    let favoriteDataSource: FavoriteDataSource
    
    init(movie: Movie, favoriteDataSource: FavoriteDataSource) {
        self.movie = movie
        self.favoriteDataSource = favoriteDataSource
    }
    
    func loadData() {
        let isFavorite = favoriteDataSource.isFavorite(id: movie.id)
        let movieViewModel = MovieDetailViewModel(title: movie.title, poster: movie.poster, isFavorite: isFavorite)
        presenter?.show(movieViewModel)
    }
}
