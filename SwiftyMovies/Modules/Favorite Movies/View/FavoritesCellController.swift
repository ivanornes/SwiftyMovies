//
//  FavoritesCellController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import UIKit
import Kingfisher

public class FavoritesCellController: NSObject, UITableViewDataSource {
    
    private let reuseIdentifier = "FavoritesCell"
    
    private let model: Movie
    private let favoriteDataSource: FavoriteDataSource
    private let selection: (Movie) -> Void
    
    public init(model: Movie, favoriteDataSource: FavoriteDataSource, selection: @escaping (Movie) -> Void) {
        self.model = model
        self.favoriteDataSource = favoriteDataSource
        self.selection = selection
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! FavoritesCell
        cell.titleLabel.text = model.title
        cell.posterImageView.kf.indicatorType = .activity
        if let url = model.posterURL {
            cell.posterImageView.kf.setImage(with: url,
                                             placeholder: UIImage(named: "posterPlaceholder"))
        }
        cell.starButton.setImage(getStarImage(), for: .normal)
        cell.starButton.addTarget(self, action: #selector(starPress(_:)), for: .touchUpInside)
        return cell
    }
    
    private func getStarImage() -> UIImage? {
        let isFavorite = favoriteDataSource.isFavorite(id: model.id)
        return isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
    }
    
    @objc private func starPress(_ sender: UIButton) {
        let isFavorite = favoriteDataSource.isFavorite(id: model.id)
        favoriteDataSource.setFavorite(id: model.id, value: !isFavorite)
        sender.setImage(getStarImage(), for: .normal)
    }
}

extension FavoritesCellController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selection(model)
    }
}
