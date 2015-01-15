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
}
