//
//  MovieFeedInteractor.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import Foundation

class MovieFeedInteractor: MovieFeedInteractorInputProtocol {
    
    weak var presenter: MovieFeedInteractorOutputProtocol?
    
    let dataSource: MovieDataSource
    let moviesPerPage = 15
    var currentPage = 0
    var isLoading = false
    
    init(dataSource: MovieDataSource) {
        self.dataSource = dataSource
    }
    
    func loadMovies() {
        isLoading = true
        dataSource.getMovies(limit: moviesPerPage * currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let movies): self?.presenter?.show(movies)
            case .failure(_): break
            }
        }
    }
    
    func loadNextPage() {
        guard !isLoading else { return }
        currentPage += 1
        loadMovies()
    }
}
