//
//  TMDB.swift
//  SwiftMovies
//
//  Created by Tom Piarulli on 1/8/15.
//  Copyright (c) 2015 Philly Cocoaheads. All rights reserved.
//

import Foundation

let TMDB_API_KEY = "8a4a247d072d9ca4a0072893ab60e277"
let TMDB_API_BASE_URL = "http://api.themoviedb.org/3"
let TMDB_IMAGE_BASE_URL = "http://image.tmdb.org/t/p"

// A generic is like a placeholder for type
// Here we are saying that Result will have an object
// of some type associated with the Success case
// but we don't need to specify what type until we use it
// This lets us reuse the result enum for any object type!
enum Result<T> {
    case Success(T)
    case Failure
}

// Here we are using a protocol to say that
// an APIResponse should have a failable initializer
// that takes in a JSON object (provided by SwiftyJSON)
protocol APIResponse {
    init?(json:JSON)
}

final class TMDB {
    // The new syntax for #pragma mark gives us a bookmark in the path bar
    // MARK: MovieResponse
    
    // We can nest the struct inside the class and access it like TMDB.MovieResponse
    struct MovieResponse: APIResponse {
        // We specify the properties we want to be required as constants
        // And properties we consider optional as optionals
        let tmdbId: Int
        let title: String
        let overview: String?
        let averageRating: Double?
        let voteCount: Int?
        let releaseDate: String?
        let genres: [String]?
        let runtime: Int?
        let posterPath: String?
        let backdropPath: String?
        
        // Adding ? to an initializer makes it failable
        // This means that just like an optional the init
        // function can return nil
        // We are doing this here because we don't want it to
        // be possible to have a Movie without an id and title
        // this way we never return invalid results
        init?(json: JSON) {
            let jsonId           = json["id"]
            let jsonTitle        = json["title"]
            let jsonOverview     = json["overview"]
            let jsonVoteAverage  = json["vote_average"]
            let jsonVoteCount    = json["vote_count"]
            let jsonReleaseDate  = json["release_date"]
            let jsonRuntime      = json["runtime"]
            let jsonPosterPath   = json["poster_path"]
            let jsonBackdropPath = json["backdrop_path"]
            let jsonGenres       = json["genres"]
            
            // Required fields
            // If any require fields are missing we want to fail
            if let id = jsonId.int {
                self.tmdbId = id
            } else {
                return nil
            }
            
            if let title = jsonTitle.string {
                self.title = title
            } else {
                return nil
            }
            
            // Optional fields
            // The TMDB api returns "" for a missing string, 0 for a missing int, 0.0 for missing double
            // As a result we need to process these as we want to be able to set our interface
            // based on whether these values are really present (and we want those to be invalid)
            // This could be a bunch of if statements but the ternary operator condenses it
            // However this is not very readable - this should be replaced with a function that processes the results
            self.overview      = (jsonOverview.stringValue.isEmpty ? nil: jsonOverview.string)
            self.averageRating = (jsonVoteAverage.doubleValue.isZero ? nil: jsonVoteAverage.double)
            self.voteCount     = (jsonVoteCount.intValue == 0 ? nil: jsonVoteCount.int)
            self.releaseDate   = (jsonReleaseDate.stringValue.isEmpty ? nil: jsonReleaseDate.string)
            self.runtime       = (jsonRuntime.intValue == 0 ? nil: jsonRuntime.int)
            self.posterPath    = (jsonPosterPath.stringValue.isEmpty ? nil: jsonPosterPath.string)
            self.backdropPath  = (jsonBackdropPath.stringValue.isEmpty ? nil: jsonBackdropPath.string)
            
            if let jsonArray = jsonGenres.array {
                var genreArray: [String] = []
                
                for jsonGenre in jsonArray {
                    if let genreString = jsonGenre["name"].string {
                        genreArray.append(genreString)
                    }
                }
                
                if !genreArray.isEmpty {
                    self.genres = genreArray
                }
            }
            
        }
    }
    
    // MARK: MovieList
    
    // Enums are very powerful in swift
    // They can have (non-stored) properties and methods
    // Enum types can also have non-integer values
    enum MovieList {
        case Popular
        case Upcoming
        case NowPlaying
        case TopRated
        
        static let allLists = [Popular, Upcoming, NowPlaying, TopRated]
        
        var queryPath: String {
            switch self {
            case .Popular:
                return "popular"
            case .Upcoming:
                return "upcoming"
            case .NowPlaying:
                return "now_playing"
            case .TopRated:
                return "top_rated"
            }
        }
        
        var listName: String {
            switch self {
            case .Popular:
                return "Popular"
            case .Upcoming:
                return "Upcoming"
            case .NowPlaying:
                return "Now Playing"
            case .TopRated:
                return "Top Rated"
            }
        }
    }
    
    // We use typealiases to avoid typing out long code blocks and to make our parameters more readable
    typealias MoviesCompletion = (result: Result<[Movie]>) -> Void
    typealias MovieCompletion = (result: Result<Movie>) -> Void
    
    // MARK: Query Methods
    
    class func fetchMovieList(list: MovieList, completion: MoviesCompletion) {
        let urlString = "\(TMDB_API_BASE_URL)/movie/\(list.queryPath)?api_key=\(TMDB_API_KEY)"
        
        let request = NSURLRequest(URL: NSURL(string: urlString)!)

        // This method when passed the Main Queue will execute the completion closure on the Main Thread
        // Otherwise we would want to get the Main Thread before executing our completion closure
        // As we are going to be doing our interfaced updates in the completion
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            // SwiftyJSON makes JSON parsing much easier
            // Otherwise we would need a huge nest of if/let statements
            // Or we would need to use a more advanced approach (creating our own JSON parser)
            if data == nil {
                completion(result: Result.Failure)
                return
            }
            
            let json = JSON(data: data)
            
            if let results = json["results"].array {
                var moviesArray: [Movie] = []
                
                for jsonMovie in results {
                    if let movieResponse = MovieResponse(json: jsonMovie) {
                        let movie = Movie(TMDBResponse: movieResponse)
                        moviesArray.append(movie)
                    }
                }
                
                // Our result enum makes error handling a breeze
                completion(result: Result.Success(moviesArray))
                return
            }
            
            // If we make it here something went wrong
            completion(result: Result.Failure)
        }
    }
    
    class func fetchMovie(id: Int, completion: MovieCompletion) {
        let urlString = "\(TMDB_API_BASE_URL)/movie/\(id)?api_key=\(TMDB_API_KEY)"
        let request = NSURLRequest(URL: NSURL(string: urlString)!)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
            (response:NSURLResponse!, data:NSData!, error:NSError!) -> Void in
            let jsonMovie = JSON(data: data)
            
            if let movieResponse = MovieResponse(json: jsonMovie) {
                let movie = Movie(TMDBResponse: movieResponse)
                completion(result: Result.Success(movie))
                return
            }
            
            // If we make it here something went wrong
            completion(result: Result.Failure)
        }
    }
}