//
//  MovieListDataSource.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 26/12/20.
//

import Foundation

public protocol MovieListDataSource {
    func getMovies(limit: Int, onCompletion: @escaping (Result<[Movie], Swift.Error>)->Void)
}
