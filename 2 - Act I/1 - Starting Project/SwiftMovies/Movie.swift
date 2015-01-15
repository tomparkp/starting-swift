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
    let rating: Rating
    
    init(title: String, posterPath: String, rating: Rating) {
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
    var averageRating: Double
    var voteCount: Int
}