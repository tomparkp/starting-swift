//
//  MovieCollectionController.swift
//  SwiftMovies
//
//  Created by Tom Piarulli on 1/8/15.
//  Copyright (c) 2015 Philly Cocoaheads. All rights reserved.
//

import UIKit

// Since we don't have to worry about headers and imports in Swift
// It sometimes makes sense to keep multiple classes in the same file
final class MovieCell: UICollectionViewCell {
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
}

final class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // We will later be fetching our movies from the web
    // so we went to use a var such that we can update our movies after load
    // We need to have a value, so we default to an empty array
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.loadPlaceholderData()
    }
    
    func loadPlaceholderData() {
        let goneGirl = Movie(title: "Gone Girl", posterPath: "gonePoster", averageRating: 8.1, voteCount: 845)
        let guardians = Movie(title: "Guardians of the Galaxy", posterPath: "guardiansPoster", averageRating: 9.2, voteCount: 1026)
        let theHobbit = Movie(title: "The Hobbit", posterPath: "hobbitPoster", averageRating: 7.4, voteCount: 1343)
        let theInterview = Movie(title: "The Interview", posterPath: "interviewPoster", averageRating: 6.3, voteCount: 824)
        
        self.movies = [goneGirl, guardians, theHobbit, theInterview]
        self.collectionView.reloadData()
    }
}

// Class extensions make it easy to group functionality, like protocol methods
extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let movieCell = collectionView.dequeueReusableCellWithReuseIdentifier("movieCell", forIndexPath: indexPath) as MovieCell
        let movie = self.movies[indexPath.row]
        movieCell.imageView.image = UIImage(named: movie.posterPath)
        
        return movieCell
    }
}