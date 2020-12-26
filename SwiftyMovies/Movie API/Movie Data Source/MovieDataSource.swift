//
//  MovieDataSource.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 26/12/20.
//

import Foundation

public protocol MovieDataSource {
    func getMovies(onCompletion: @escaping (Result<[Movie], Swift.Error>)->Void)
}
