//
//  MovieViewController.swift
//  SwiftMovies
//
//  Created by Tom Piarulli on 1/8/15.
//  Copyright (c) 2015 Philly Cocoaheads. All rights reserved.
//

import UIKit

// Final signifies there will be no subclasses of SettingsViewController (optimization)
final class DetailViewController: UIViewController {
    @IBOutlet weak var backdropImageView: UIImageView!
    @IBOutlet weak var backdropActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var runtimeLabel: UILabel!
    
    var movie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMovieInfo()
    }
    
    private func loadMovieInfo() {
        // Setup our empty state (how the screen should look while loading)
        let ellipsis = "..."
        self.backdropImageView.image = nil
        self.titleLabel.text = ellipsis
        self.navigationItem.title = ellipsis
        self.ratingLabel.text = ellipsis
        self.summaryLabel.text = ellipsis
        self.releaseDateLabel.text = ellipsis
        self.genresLabel.text = ellipsis
        self.runtimeLabel.text = ellipsis
        
        if let movie = self.movie {
            self.titleLabel.text = movie.title
            self.navigationItem.title = movie.title
        }
    }
}
