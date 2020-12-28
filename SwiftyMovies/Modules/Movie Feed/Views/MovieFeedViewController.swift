//
//  MovieFeedViewController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import UIKit

final class MovieFeedViewController: UICollectionViewController, MovieFeedViewProtocol {
    
    var presenter: MovieFeedPresenterProtocol?
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Int, CellController> = {
        .init(collectionView: collectionView, cellProvider: { collectionView, indexPath, controller -> UICollectionViewCell? in
            controller.dataSource.collectionView(collectionView, cellForItemAt: indexPath)
        })
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        reloadData()
    }
    
    private func configureTableView() {
        collectionView.dataSource = dataSource
    }
    
    private func reloadData() {
        presenter?.reloadData()
    }
    
    public func show(_ sections: [CellController]...) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CellController>()
        sections.enumerated().forEach { section, cellControllers in
            snapshot.appendSections([section])
            snapshot.appendItems(cellControllers, toSection: section)
        }
        dataSource.apply(snapshot)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let delegate = cellController(at: indexPath)?.delegate
        delegate?.collectionView?(collectionView, didSelectItemAt: indexPath)
    }
    
    private func cellController(at indexPath: IndexPath) -> CellController? {
        dataSource.itemIdentifier(for: indexPath)
    }
}
