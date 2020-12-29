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
    let movieDetailDataSource: MovieDetailDataSource
    let favoriteDataSource: FavoriteDataSource
    
    init(movie: Movie, movieDetailDataSource: MovieDetailDataSource, favoriteDataSource: FavoriteDataSource) {
        self.movie = movie
        self.movieDetailDataSource = movieDetailDataSource
        self.favoriteDataSource = favoriteDataSource
    }
    
    func loadData() {
        let isFavorite = favoriteDataSource.isFavorite(id: movie.id)
        movieDetailDataSource.getMovie(id: movie.id) { result in
            switch result {
            case .success(let detail):
                let movieViewModel = MovieDetailViewModel(title: detail.title, poster: detail.poster, isFavorite: isFavorite, overview: detail.overview,
                                                          rating: detail.rating)
                self.presenter?.show(movieViewModel)
            case .failure(_): break
            }
        }
    }
    
    func toggleFavorite() {
        let isFavorite = favoriteDataSource.isFavorite(id: movie.id)
        favoriteDataSource.setFavorite(id: movie.id, value: !isFavorite)
        loadData()
    }
}
