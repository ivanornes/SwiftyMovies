//
//  MovieFeedFlowLayout.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import UIKit

class MovieFeedFlowLayout: UICollectionViewFlowLayout {
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool { true }
    
    override func prepare() {
        guard let collectionView = collectionView else { return }
        
        let cellWidth = collectionView.bounds.inset(by: collectionView.layoutMargins).width
        
        self.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.5)
        self.sectionInset = UIEdgeInsets(top: self.minimumInteritemSpacing, left: 0.0, bottom: 0.0, right: 0.0)
        self.sectionInsetReference = .fromSafeArea
    }
}
