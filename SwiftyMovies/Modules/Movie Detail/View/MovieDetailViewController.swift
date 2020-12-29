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
    
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var posterImageView: UIImageView!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshData?()
    }
    
    public func setMovieTitle(_ title: String) {
        self.title = title
    }
    
    public func setPosterImage(_ poster: String?) {
        guard let poster = poster else {
            DispatchQueue.main.async {
                self.posterImageView.image = UIImage(named: "posterPlaceholder")
            }
            return
        }
        posterImageView.kf.setImage(with: URL(string: poster))
    }
    
    public func setIsFavorite(_ isFavorite: Bool) {
        let item = UIBarButtonItem(image: getStarImage(isFavorite: isFavorite),
                                   style: .plain,
                                   target: self,
                                   action: #selector(tapOnfavorite))
        DispatchQueue.main.async {
            self.navigationItem.rightBarButtonItem = item
        }
    }
    
    @objc func tapOnfavorite() {
        toggleFavorite?()
    }
    
    private func getStarImage(isFavorite: Bool) -> UIImage? {
        return isFavorite ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
    }
    
    public func setOverview(_ overview: String) {
        DispatchQueue.main.async {
            self.overviewLabel.text = overview
        }
    }
    
    public func setRating(_ rating: String) {
        DispatchQueue.main.async {
            self.ratingLabel.text = rating
        }
    }
}
