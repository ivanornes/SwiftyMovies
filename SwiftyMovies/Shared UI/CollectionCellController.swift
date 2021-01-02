//
//  CollectionCellController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import UIKit

public struct CollectionCellController {
    let id: AnyHashable
    let dataSource: UICollectionViewDataSource
    let delegate: UICollectionViewDelegate?
    
    public init(id: AnyHashable, _ dataSource: UICollectionViewDataSource) {
        self.id = id
        self.dataSource = dataSource
        self.delegate = dataSource as? UICollectionViewDelegate
    }
}

extension CollectionCellController: Equatable {
    public static func == (lhs: CollectionCellController, rhs: CollectionCellController) -> Bool {
        lhs.id == rhs.id
    }
}

extension CollectionCellController: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
