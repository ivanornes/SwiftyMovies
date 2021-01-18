//
//  FavoritesInteractor.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation

public final class FavoritesInteractor: FavoritesInteractorInputProtocol {
    
    public weak var presenter: FavoritesInteractorOutputProtocol?
    
    private let listDataSource: MovieListDataSource
    private let detailDataSource: MovieDetailDataSource
    private let favoriteDataSource: FavoriteDataSource
    
    public init(listDataSource: MovieListDataSource,
         detailDataSource: MovieDetailDataSource,
         favoriteDataSource: FavoriteDataSource) {
        self.listDataSource = listDataSource
        self.detailDataSource = detailDataSource
        self.favoriteDataSource = favoriteDataSource
    }
    
    public func loadMovies() {
        DispatchQueue.global(qos: .userInitiated).async {
            let movieDetailGroup = DispatchGroup()
            var movies: [Movie] = []
            let movieIDs = self.favoriteDataSource.getFavorites()
            for id in movieIDs {
                movieDetailGroup.enter()
                self.detailDataSource.getMovie(id: id) { result in
                    switch result {
                    case let .success(detail): movies.append(detail.movie)
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
    
    public func toggledFavorite(_ movie: Movie) {
        loadMovies()
    }
}
