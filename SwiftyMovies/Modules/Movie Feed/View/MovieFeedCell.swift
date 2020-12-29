//
//  MovieFeedCell.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import UIKit

public final class MovieFeedCell: UICollectionViewCell {
    @IBOutlet private(set) public var titleLabel: UILabel!
    @IBOutlet private(set) public var posterImageView: UIImageView!
    @IBOutlet private(set) public var starButton: UIButton!
    
    public var model: Movie!
    public var favoriteDataSource: FavoriteDataSource!
    
    public func configure() {
        titleLabel.text = model.title
        posterImageView.kf.indicatorType = .activity
        if let url = model.posterURL {
            posterImageView.kf.setImage(with: url,
                                        placeholder: UIImage(named: "posterPlaceholder"))
        }
        let isFavorite = favoriteDataSource.isFavorite(id: model.id)
        starButton.setImage(getStarImage(isFavorite), for: .normal)
        starButton.addTarget(self, action: #selector(starPress(_:)), for: .touchUpInside)
    }
    
    private func getStarImage(_ isFavorite: Bool) -> UIImage? {
        return isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
    }
    
    @objc private func starPress(_ sender: UIButton) {
        var isFavorite = favoriteDataSource.isFavorite(id: model.id)
        isFavorite.toggle()
        favoriteDataSource.setFavorite(id: model.id, value: isFavorite)
        sender.setImage(getStarImage(isFavorite), for: .normal)
    }
}
