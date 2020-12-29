//
//  MovieFeedInteractor.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import Foundation

class MovieFeedInteractor: MovieFeedInteractorInputProtocol {
    
    weak var presenter: MovieFeedInteractorOutputProtocol?
    
    let listDataSource: MovieListDataSource
    let moviesPerPage = 15
    var currentPage = 1
    var isLoading = false
    
    init(listDataSource: MovieListDataSource) {
        self.listDataSource = listDataSource
    }
    
    func loadMovies() {
        isLoading = true
        listDataSource.getMovies(limit: moviesPerPage * currentPage) { [weak self] result in
            self?.isLoading = false
            switch result {
            case .success(let movies): self?.presenter?.show(movies)
            case .failure(_): self?.presenter?.showError()
            }
        }
    }
    
    func loadNextPage() {
        guard !isLoading else { return }
        currentPage += 1
        loadMovies()
    }
}
