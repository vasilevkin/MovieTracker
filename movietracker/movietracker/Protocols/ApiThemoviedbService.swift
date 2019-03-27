//
//  ApiThemoviedbService.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 27/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

/**
 Service communicates with themoviedb.org api
 Consists of separate providers
 */
protocol ApiThemoviedbService: ApiThemoviedbMoviesProvider, ApiThemoviedbAuthProvider {
    
}
