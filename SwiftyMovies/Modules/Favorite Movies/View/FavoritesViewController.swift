//
//  FavoritesViewController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 29/12/20.
//

import UIKit

class FavoritesViewController: UITableViewController, FavoritesViewProtocol {

    var presenter: FavoritesPresenterProtocol?
    
    private lazy var dataSource: UITableViewDiffableDataSource<Int, TableCellController> = {
        .init(tableView: tableView, cellProvider: { tableView, indexPath, controller -> UITableViewCell? in
            controller.dataSource.tableView(tableView, cellForRowAt: indexPath)
        })
    }()
}
