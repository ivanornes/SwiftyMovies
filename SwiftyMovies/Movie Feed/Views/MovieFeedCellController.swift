//
//  MovieFeedCellController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import UIKit

public class MovieFeedCellController: NSObject, UICollectionViewDataSource {
    
    private let reuseIdentifier = "MovieFeedCell"
    
    private let model: Movie
    
    public init(model: Movie) {
        self.model = model
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! MovieFeedCell
        cell.titleLabel.text = model.title
        if let url = model.posterURL {
            DispatchQueue.global().async {
                if let imageData = try? Data(contentsOf: url),
                   let image = UIImage(data: imageData) {
                    DispatchQueue.main.async {
                        cell.posterImageView.image = image
                    }
                }
            }
        }
        return cell
    }
}
