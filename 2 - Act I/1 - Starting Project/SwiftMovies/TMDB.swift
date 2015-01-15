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


final class TMDB {
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
}