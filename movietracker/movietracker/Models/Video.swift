//
//  Video.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 16/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

/**
 Data struct model for Video

 Detail description:
 - Movies - https://developers.themoviedb.org/3/movies/get-movie-videos
 - TV Shows - https://developers.themoviedb.org/3/tv/get-tv-videos
 */
struct Video: Decodable {
    let iso6391: String?
    let iso31661: String?
    let key: String?
    let name: String?
    let site: String?
    let size: Int?
    let type: String?
    let videoId: Int

    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso_639_1"
        case iso31661 = "iso_3166_1"
        case key = "key"
        case name = "name"
        case site = "site"
        case size = "size"
        case type = "type"
        case videoId = "id"
    }
}
