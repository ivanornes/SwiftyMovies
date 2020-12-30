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
    var lockNextRequests = false
    
    init(listDataSource: MovieListDataSource) {
        self.listDataSource = listDataSource
    }
    
    func loadMovies() {
        isLoading = true
        listDataSource.getMovies(limit: moviesPerPage * currentPage) { [weak self] result in
            self?.processResult(result)
            self?.isLoading = false
        }
    }
    
    func processResult(_ result: Result<[Movie], Error>) {
        switch result {
        case .success(let movies):
            guard !movies.isEmpty else { return }
            presenter?.show(movies)
        case .failure(_): presenter?.showError()
        }
    }
    
    func loadNextPage() {
        guard !isLoading && !lockNextRequests else { return }
        lockNextRequests = true
        currentPage += 1
        loadMovies()
    }
    
    func unlockNextPageLoadRequests() {
        lockNextRequests = false
    }
}
