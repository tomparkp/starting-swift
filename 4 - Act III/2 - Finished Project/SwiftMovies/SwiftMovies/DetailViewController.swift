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
        self.backdropImageView.image = nil
        self.titleLabel.text = ""
        self.navigationItem.title = ""
        self.ratingLabel.text = ""
        self.summaryLabel.text = ""
        self.releaseDateLabel.text = ""
        self.genresLabel.text = ""
        self.runtimeLabel.text = ""
        
        if let movie = self.movie {
            // Since title is not an optional, we know we will always
            // have one as long as the movie exists
            self.titleLabel.text = movie.title
            self.navigationItem.title = movie.title
            
            // Swift allows a shorthand if a closure is the last parameter
            // of a function, as seen here
            TMDB.fetchMovie(movie.tmdbId) {
                // When we use the shorthand we don't have a named result
                // so we need to reference parameters by position $0, $1, etc.
                // these are automatic shorthand argument names generated by Swift
                switch $0 {
                case .Success(let movie):
                    self.movie = movie
                case .Failure:
                    self.displayNetworkError()
                }
                
                // We always want to update the inferface, because the function is designed
                // to handle missing values appropriately
                self.updateInterface()
            }
        } else {
            // If we don't have a movie to load skip fetching, display error message
            self.displayNetworkError()
            self.updateInterface()
        }
    }
    
    private func updateInterface() {
        let na = "Not Available"
        
        // We can use optional chaining and the Nil Coalescing operater to avoid a long list of if/let/else statements
        self.titleLabel.text = self.movie?.title ?? na
        self.ratingLabel.text = self.ratingString(self.movie?.rating) ?? "N/A"
        self.summaryLabel.text = self.movie?.summary ?? "No Synopsis Available."
        self.releaseDateLabel.text = self.movie?.releaseDate ?? na
        self.genresLabel.text = self.genresString(self.movie?.genres) ?? na
        self.runtimeLabel.text = self.minutesString(self.movie?.runtime) ?? na
        
        self.loadBackdropImage()
    }

    // Since we use it in multiple locations, it makes sense to seperate our error display into a function
    private func displayNetworkError() {
        let errorMessage = "We were unable to fetch movie information. Please check your connection or try again later."
        let alert = UIAlertController(title: "Sorry", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    private func loadBackdropImage() {
        let emptyImage = UIImage(named: "noBackdrop")
        
        if let movie = self.movie {
            self.backdropActivityIndicator.startAnimating()
            
            movie.loadBackdropImage() {
                switch $0 {
                case .Success(let backdropImage):
                    self.backdropImageView.image = backdropImage
                case .Failure:
                    self.backdropImageView.image = emptyImage
                }
                
                self.backdropActivityIndicator.stopAnimating()
            }
        } else {
            // Being extra safe
            self.backdropImageView.image = emptyImage
        }
    }
    
    // When we see isolated chunks of code cluttering a function
    // it often makes sense to seperate it into its own function
    private func genresString(genres: [String]?) -> String? {
        if let genresArray = genres {
            var genreString = ""
            
            for (index, genre) in enumerate(genresArray) {
                genreString += genre
                
                // index starts at 0 so we need count - 1
                if index != genresArray.count - 1 {
                    genreString += ", "
                }
            }
            
            return genreString
        }
        
        return nil
    }
    
    private func minutesString(minutes: Int?) -> String? {
        if let m = minutes {
            return "\(m) minutes"
        }
        
        return nil
    }
    
    private func ratingString(rating: Rating?) -> String? {
        if let r = rating {
            return "\(r.averageRating) (\(r.voteCount))"
        }
        
        return nil
    }
}
