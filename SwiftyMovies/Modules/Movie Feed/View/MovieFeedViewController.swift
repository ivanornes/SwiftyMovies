//
//  MovieFeedViewController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 27/12/20.
//

import UIKit

final class MovieFeedViewController: UICollectionViewController, MovieFeedViewProtocol {
    
    var presenter: MovieFeedPresenterProtocol?
    var reloadData: (() -> Void)?
    var loadNextPage: (() -> Void)?
    var showFavorites: (() -> Void)?
    var unlockNextPageLoadRequests: (() -> Void)?
    private let errorView = ErrorView()
    
    private lazy var dataSource: UICollectionViewDiffableDataSource<Int, CollectionCellController> = {
        .init(collectionView: collectionView, cellProvider: { collectionView, indexPath, controller -> UICollectionViewCell? in
            controller.dataSource.collectionView(collectionView, cellForItemAt: indexPath)
        })
    }()
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        configureNavigationBarItems()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadData?()
    }
    
    private func configureCollectionView() {
        collectionView.dataSource = dataSource
    }
    
    private func configureNavigationBarItems() {
        let item = UIBarButtonItem(image: UIImage(systemName: "star.fill"),
                                   style: .plain,
                                   target: self,
                                   action: #selector(favoriteTap))
        navigationItem.leftBarButtonItem = item
    }
    
    @objc private func favoriteTap() {
        showFavorites?()
    }
    
    public func show(_ sections: [CollectionCellController]...) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CollectionCellController>()
        sections.enumerated().forEach { section, cellControllers in
            snapshot.appendSections([section])
            snapshot.appendItems(cellControllers, toSection: section)
        }
        dataSource.apply(snapshot)
    }
    
    public func showError() {
        errorView.errorText = "Error loading movie data"
        present(errorView, animated: true, completion: nil)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let delegate = cellController(at: indexPath)?.delegate
        delegate?.collectionView?(collectionView, didSelectItemAt: indexPath)
    }
    
    private func cellController(at indexPath: IndexPath) -> CollectionCellController? {
        dataSource.itemIdentifier(for: indexPath)
    }
    
    internal override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard scrollView.isDragging else { return }
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.size.height {
            loadNextPage?()
        }
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        unlockNextPageLoadRequests?()
    }
}
