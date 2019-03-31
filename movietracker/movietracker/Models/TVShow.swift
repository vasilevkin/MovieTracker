//
//  TVShow.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 31/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

/**
 Data struct model for TVShow
 
 Detail description: https://developers.themoviedb.org/3/tv/get-tv-details
 */
struct TVShow: Decodable {
    let backdropPath: String?
    let firstAirDate: String?
    let genres: [Genre]?
    let homepage: String?
    let tvShowId: Int
    let inProduction: Bool?
    let languages: [String]?
    let lastAirDate: String?
    let name: String
    let numberOfEpisodes: Int?
    let numberOfSeasons: Int?
    let originCountry: [String]?
    let originalLanguage: String?
    let originalName: String?
    let overview: String?
    let popularity: Double?
    let posterPath: String?
    let status: String?
    let tvShowType: String?
    let voteAverage: Double?
    let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case firstAirDate = "first_air_date"
        case genres = "genres"
        case homepage = "homepage"
        case tvShowId = "id"
        case inProduction = "in_production"
        case languages = "languages"
        case lastAirDate = "last_air_date"
        case name = "name"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case originCountry = "origin_country"
        case originalLanguage = "original_language"
        case originalName = "original_name"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case status = "status"
        case tvShowType = "type"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
