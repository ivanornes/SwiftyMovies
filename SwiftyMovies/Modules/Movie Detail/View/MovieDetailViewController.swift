//
//  MovieDetailViewController.swift
//  SwiftyMovies
//
//  Created by Ivan Ornes on 28/12/20.
//

import UIKit

public final class MovieDetailViewController: UIViewController, MovieDetailViewProtocol {
    
    var presenter: MovieDetailPresenter?
    var refreshData: (() -> Void)?
    var toggleFavorite: (() -> Void)?
    
    @IBOutlet weak var posterImageView: UIImageView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshData?()
    }
    
    public func setTitle(_ title: String) {
    }
    
    public func setPosterImage(_ poster: String?) {
        guard let poster = poster else {
            posterImageView.image = UIImage(named: "posterPlaceholder")
            return
        }
        posterImageView.kf.setImage(with: URL(string: poster))
    }
    
    public func setIsFavorite(_ isFavorite: Bool) {
        let item = UIBarButtonItem(image: getStarImage(isFavorite: isFavorite),
                                   style: .plain,
                                   target: self,
                                   action: #selector(tapOnfavorite))
        navigationItem.rightBarButtonItem = item
    }
    
    @objc func tapOnfavorite() {
        toggleFavorite?()
    }
    
    private func getStarImage(isFavorite: Bool) -> UIImage? {
        return isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
    }
}
