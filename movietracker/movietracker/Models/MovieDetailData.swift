//
//  MovieDetailData.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 02/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

struct MovieDetailData {
    let title: String
    let releaseDate: String?
    let overview: String?
    let genres: String?
    let runtime: String?
    let voteAverage: String?
    let posterPath: String?
    let voteCount: String?
    let status: String?
}

extension MovieDetailData {
    
    init(movie: Movie) {
        self.title = movie.title
        self.releaseDate = movie.releaseDate
        self.overview = movie.overview
        self.genres = movie.genres
            .flatMap {
                $0.map { $0.name }
                    .prefix(2)
                    .joined(separator: ", ")
            } ?? ""
        self.runtime = movie.runtime
            .flatMap { "\($0 / 60)hr \($0 % 60)min" } ?? ""
        self.voteAverage = movie.voteAverage
            .flatMap { String($0) } ?? ""
        self.posterPath = movie.posterPath.flatMap { "http://image.tmdb.org/t/p/w780/" + $0 }
        self.voteCount = movie.voteCount
            .flatMap { String($0) } ?? ""
        self.status = movie.status ?? ""
    }
    
}
