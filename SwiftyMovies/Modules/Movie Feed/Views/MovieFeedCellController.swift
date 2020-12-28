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
    private let selection: (Movie) -> Void
    
    public init(model: Movie, selection: @escaping (Movie) -> Void) {
        self.model = model
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
        return cell
    }
}

extension MovieFeedCellController: UICollectionViewDelegate {
    public func collectionView(_: UICollectionView, didSelectItemAt: IndexPath) {
        selection(model)
    }
}
