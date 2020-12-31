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
        mapAndPresentMovie(movie)
        movieDetailDataSource.getMovie(id: movie.id) { result in
            switch result {
            case .success(let detail): self.mapAndPresentMovieDetail(detail)
            case .failure(_): break
            }
        }
    }

    func mapAndPresentMovie(_ movie: Movie) {
        let isFavorite = favoriteDataSource.isFavorite(id: movie.id)
        let movieViewModel = MovieDetailViewModel(movie, isFavorite: isFavorite)
        presenter?.show(movieViewModel)
    }
    
    func mapAndPresentMovieDetail(_ detail: MovieDetail) {
        let isFavorite = favoriteDataSource.isFavorite(id: movie.id)
        let movieViewModel = MovieDetailViewModel(detail, isFavorite: isFavorite)
        presenter?.show(movieViewModel)
    }
    
    func toggleFavorite() {
        let isFavorite = favoriteDataSource.isFavorite(id: movie.id)
        favoriteDataSource.setFavorite(id: movie.id, value: !isFavorite)
        loadData()
    }
}
