//
//  MovieFeedCellController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import UIKit
import Kingfisher

public class MovieFeedCellController: NSObject, UICollectionViewDataSource {
    
    private let reuseIdentifier = "MovieFeedCell"
    
    private let model: Movie
    private let favoriteDataSource: FavoriteDataSource
    private let selection: (Movie) -> Void
    
    public init(model: Movie, favoriteDataSource: FavoriteDataSource, selection: @escaping (Movie) -> Void) {
        self.model = model
        self.favoriteDataSource = favoriteDataSource
        self.selection = selection
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieFeedCell
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

extension MovieFeedCellController: UICollectionViewDelegate {
    public func collectionView(_: UICollectionView, didSelectItemAt: IndexPath) {
        selection(model)
    }
}
