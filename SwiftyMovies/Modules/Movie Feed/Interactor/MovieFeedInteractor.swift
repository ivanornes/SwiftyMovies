//
//  MovieFeedInteractor.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import Foundation

public final class MovieFeedInteractor: MovieFeedInteractorInputProtocol {
    
    public weak var presenter: MovieFeedInteractorOutputProtocol?
    
    private let listDataSource: MovieListDataSource
    private let moviesPerPage = 15
    private var currentPage = 1
    private var isLoading = false
    private var lockNextRequests = false
    
    public init(listDataSource: MovieListDataSource) {
        self.listDataSource = listDataSource
    }
    
    public func loadMovies() {
        isLoading = true
        listDataSource.getMovies(limit: moviesPerPage * currentPage) { [weak self] result in
            self?.processResult(result)
            self?.isLoading = false
        }
    }
    
    private func processResult(_ result: Result<[Movie], Error>) {
        switch result {
        case .success(let movies):
            guard !movies.isEmpty else { return }
            presenter?.show(movies)
        case .failure(_): presenter?.showError()
        }
    }
    
    public func loadNextPage() {
        guard !isLoading && !lockNextRequests else { return }
        lockNextRequests = true
        currentPage += 1
        loadMovies()
    }
    
    public func unlockNextPageLoadRequests() {
        lockNextRequests = false
    }
}
