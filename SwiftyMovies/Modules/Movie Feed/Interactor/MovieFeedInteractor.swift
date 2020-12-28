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
    
    init(dataSource: MovieDataSource) {
        self.dataSource = dataSource
    }
    
    func loadMovies() {
        dataSource.getMovies { [weak self] result in
            switch result {
            case .success(let movies): self?.presenter?.show(movies)
            case .failure(_): break
            }
        }
    }
}
