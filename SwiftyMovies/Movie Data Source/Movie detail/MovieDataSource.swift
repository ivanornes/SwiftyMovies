//
//  MovieDataSource.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import Foundation

public protocol MovieDetailDataSource {
    func getMovie(id: Int, onCompletion: @escaping (Result<Movie, Swift.Error>)->Void)
}
