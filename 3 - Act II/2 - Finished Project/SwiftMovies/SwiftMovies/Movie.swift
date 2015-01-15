//
//  Movie.swift
//  SwiftMovies
//
//  Created by Tom Piarulli on 1/5/15.
//  Copyright (c) 2015 Philly Cocoaheads. All rights reserved.
//

import UIKit

final class Movie {
    let title: String
    let posterPath: String
    //let averageRating: Double
    //let voteCount: Int
    let rating: Rating
    
    // Swift requires that all properties (except optionals which we will cover later)
    // be initialized prior to the creation of the object
    /* init(title: String, posterPath: String, averageRating: Double, voteCount: Int) {
        // Try commenting one out to see what happens
        self.title = title
        self.posterPath = posterPath
        self.averageRating = averageRating
        self.voteCount = voteCount
    }*/
    
    init(title: String, posterPath: String, rating: Rating) {
        // Try commenting one out to see what happens
        self.title = title
        self.posterPath = posterPath
        self.rating = rating
    }
    
    convenience init(title: String, posterPath: String, averageRating: Double, voteCount: Int) {
        let rating = Rating(averageRating: averageRating, voteCount: voteCount)
        self.init(title: title, posterPath: posterPath, rating: rating)
    }
}

struct Rating {
    let averageRating: Double
    let voteCount: Int
}