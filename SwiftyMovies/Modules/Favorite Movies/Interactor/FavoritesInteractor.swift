//
//  FavoritesInteractor.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation

class FavoritesInteractor: FavoritesInteractorInputProtocol {
    
    weak var presenter: FavoritesInteractorOutputProtocol?
    
    let listDataSource: MovieListDataSource
    let detailDataSource: MovieDetailDataSource
    let favoriteDataSource: FavoriteDataSource
    
    init(listDataSource: MovieListDataSource,
         detailDataSource: MovieDetailDataSource,
         favoriteDataSource: FavoriteDataSource) {
        self.listDataSource = listDataSource
        self.detailDataSource = detailDataSource
        self.favoriteDataSource = favoriteDataSource
    }
    
    func loadMovies() {
        DispatchQueue.global(qos: .userInitiated).async {
            let movieDetailGroup = DispatchGroup()
            var movies: [Movie] = []
            let movieIDs = self.favoriteDataSource.getFavorites()
            for id in movieIDs {
                movieDetailGroup.enter()
                self.detailDataSource.getMovie(id: id) { result in
                    switch result {
                    case .success(let movie): movies.append(movie)
                    case .failure(_): break
                    }
                    movieDetailGroup.leave()
                }
            }
            movieDetailGroup.wait()
            DispatchQueue.main.async {
                self.presenter?.show(movies.sorted(by: { $0.title <= $1.title }))
            }
        }
    }
    
    func toggledFavorite(_ movie: Movie) {
        loadMovies()
    }
}
