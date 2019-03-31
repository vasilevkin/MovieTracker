//
//  Genre.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 25/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

/**
 Data struct model for Genre
 
 Detail description: https://developers.themoviedb.org/3/genres/get-movie-list
 */
struct Genre: Decodable {
    let genreId: Int
    let name: String
}
