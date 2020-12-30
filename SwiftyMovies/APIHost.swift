//
//  APIHost.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 30/12/20.
//

import Foundation

struct APIHost {
    static let local = URL(string: "http://127.0.0.1:8080")!
    static var production = URL(string: "https://tmdb.apps.quintero.io")!
}
