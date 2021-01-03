//
//  MovieFeedCellController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import UIKit
import Kingfisher

public final class MovieFeedCellController: NSObject, UICollectionViewDataSource {
    
    private let reuseIdentifier = "MovieFeedCell"
    
    private let model: Movie
    private let favoriteDataSource: FavoriteDataSource
    private let selection: (Movie) -> Void
    
    public init(model: Movie, favoriteDataSource: FavoriteDataSource, selection: @escaping (Movie) -> Void) {
        self.model = model
        self.favoriteDataSource = favoriteDataSource
        self.selection = selection
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 1 }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieFeedCell
        cell.favoriteDataSource = favoriteDataSource
        cell.model = model
        cell.configure()
        return cell
    }
}

extension MovieFeedCellController: UICollectionViewDelegate {
    public func collectionView(_: UICollectionView, didSelectItemAt: IndexPath) {
        selection(model)
    }
}
