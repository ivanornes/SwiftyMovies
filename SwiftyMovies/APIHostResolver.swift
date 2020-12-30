//
//  APIHostResolver.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 30/12/20.
//

import Foundation

struct APIHostResolver {
    static var host: URL {
        #if DEBUG
        return URL(string: "http://127.0.0.1:8080")!
        #else
        return URL(string: "https://tmdb.apps.quintero.io")!
        #endif
    }
}
