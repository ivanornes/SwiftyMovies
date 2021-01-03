//
//  FavoritesCellController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import UIKit
import Kingfisher

public final class FavoritesCellController: NSObject, UITableViewDataSource {
    
    private let reuseIdentifier = "FavoritesCell"
    
    private let model: Movie
    private let favoriteDataSource: FavoriteDataSource
    private let selection: (Movie) -> Void
    private let toggledFavorite: (Movie) -> Void
    
    public init(model: Movie, favoriteDataSource: FavoriteDataSource, selection: @escaping (Movie) -> Void, toggledFavorite: @escaping (Movie) -> Void) {
        self.model = model
        self.favoriteDataSource = favoriteDataSource
        self.selection = selection
        self.toggledFavorite = toggledFavorite
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 1 }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FavoritesCell
        cell.favoriteDataSource = favoriteDataSource
        cell.model = model
        cell.toggledFavorite = toggledFavorite
        cell.configure()
        return cell
    }
}

extension FavoritesCellController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection(model)
    }
}
