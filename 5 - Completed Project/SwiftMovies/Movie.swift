//
//  Movie.swift
//  SwiftMovies
//
//  Created by Tom Piarulli on 1/5/15.
//  Copyright (c) 2015 Philly Cocoaheads. All rights reserved.
//

import UIKit

final class Movie {
    // The pattern we've adopted lets us use constants throughout
    // and optionals only for properties that are truly optional
    let tmdbId: Int
    let title: String
    let summary: String?
    let rating: Rating?
    let releaseDate: String?
    let genres: [String]?
    let runtime: Int?
    let posterPath: String?
    let backdropPath: String?
    
    // We could use an init with JSON function or similar here
    // but doing it this way insulates our Movie class from our API service
    // We could now just as easily add a RottenTomatoes initializer for example
    init(TMDBResponse: TMDB.MovieResponse) {
        self.tmdbId = TMDBResponse.tmdbId
        self.title = TMDBResponse.title
        self.summary = TMDBResponse.overview
        
        // We only consider a rating valid if we have both the average and the vote count
        if let averageRating = TMDBResponse.averageRating {
            if let voteCount = TMDBResponse.voteCount {
                self.rating = Rating(averageRating: averageRating, voteCount: voteCount)
            }
        }
        
        self.releaseDate = TMDBResponse.releaseDate
        self.genres = TMDBResponse.genres
        self.runtime = TMDBResponse.runtime
        self.posterPath = TMDBResponse.posterPath
        self.backdropPath = TMDBResponse.backdropPath
    }
    
    // A Type Alias is just like it sounds - its a shorthand name for a specific type
    // It comes in handy for blocks where the syntax is a bit unruly, especially
    // when the block is a function parameter
    typealias ImageCompletion = (result: Result<UIImage>) -> Void
    
    func loadPosterImage(completion: ImageCompletion) {
        if let posterPath = self.posterPath {
            // For the sake of this workshop we are passing a hardcoded image size parameter
            // In reality we would want to query the TMDB config endpoint to fetch all of the sizes
            // and have them in a strongly typed form - like an enum
            self.loadImage("w500", path: posterPath, completion: completion)
            // returns can be handy for avoiding a lot of nesting and if/else statements
            return
        }
        
        completion(result: Result.Failure)
    }
    
    func loadBackdropImage(completion: ImageCompletion) {
        if let backdropPath = self.backdropPath {
            self.loadImage("w780", path: backdropPath, completion: completion)
            return
        }
        
        completion(result: Result.Failure)
    }
    
    // Since we have two different images we have to fetch, it makes sense to keep some
    // shared logic in a seperate function to keep things DRY
    // Note that we make it a private function so there is no risk of it being called outside its own instance
    private func loadImage(size: String, path: String, completion: ImageCompletion) {
        let url = NSURL(string: "\(TMDB_IMAGE_BASE_URL)/\(size)/\(path)")
        // Another option:
        // let url = NSURL(string: TMDB_IMAGE_BASE_URL + "/" + size + "/" + path")
        if url == nil {
            completion(result: Result.Failure)
            return
        }
        
        // This method when passed the Main Queue will execute the completion closure on the Main Thread
        // Otherwise we would want to get the Main Thread before executing our completion closure
        // As we are going to be doing our interfaced updates in the completion
        NSURLConnection.sendAsynchronousRequest(NSURLRequest(URL: url!), queue: NSOperationQueue.mainQueue()) {
            (response: NSURLResponse!, data: NSData!, error: NSError!) -> Void in
            
            if data != nil {
                if let image = UIImage(data: data) {
                    completion(result: Result.Success(image))
                    return
                }
            }
            
            // If we make it here something went wrong
            completion(result: Result.Failure)
        }
    }
}

// A struct is similar to a class except that it cannot inherit
// and it is a value type (as opposed to a reference type)
// They are often used for objects that just hold data
struct Rating {
    var averageRating: Double
    var voteCount: Int
}