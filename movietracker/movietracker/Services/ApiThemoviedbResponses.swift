//
//  ApiThemoviedbResponses.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 25/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

struct AuthTokenResponse: Decodable {
    let requestToken: String
    
    enum CodingKeys: String, CodingKey {
        case requestToken = "request_token"
    }
}

struct LoginResponse: Decodable {
    let success: Bool
}

struct MoviesResponse: Decodable {
    let results: [Movie]
}

struct TVShowsResponse: Decodable {
    let results: [TVShow]
}
