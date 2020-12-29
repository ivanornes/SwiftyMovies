//
//  FavoritesViewController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import UIKit

class FavoritesViewController: UITableViewController, FavoritesViewProtocol {

    var presenter: FavoritesPresenterProtocol?
    var reloadData: (() -> Void)?
    
    private lazy var dataSource: UITableViewDiffableDataSource<Int, TableCellController> = {
        .init(tableView: tableView, cellProvider: { tableView, indexPath, controller -> UITableViewCell? in
            controller.dataSource.tableView(tableView, cellForRowAt: indexPath)
        })
    }()
    
    deinit {
        print("Favorites deinit")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        reloadData?()
    }
    
    private func configureTableView() {
        tableView.dataSource = dataSource
    }
    
    private func configureDataSource() {
        dataSource.defaultRowAnimation = .top
    }
    
    public func show(_ sections: [TableCellController]...) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, TableCellController>()
        sections.enumerated().forEach { section, cellControllers in
            snapshot.appendSections([section])
            snapshot.appendItems(cellControllers, toSection: section)
        }
        dataSource.apply(snapshot)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let delegate = cellController(at: indexPath)?.delegate
        delegate?.tableView?(tableView, didSelectRowAt: indexPath)
    }
    
    private func cellController(at indexPath: IndexPath) -> TableCellController? {
        dataSource.itemIdentifier(for: indexPath)
    }
}
