//
//  ApiThemoviedbMoviesProvider.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 26/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

/**
 Gets Movie data from themoviedb.org api
 */
protocol ApiThemoviedbMoviesProvider {
    /**
     Fetches popular movies from themoviedb.org api
     
     - Returns: Optional observable array of 'Movie' type
     */
    func fetchPopularMovies() -> Observable<[Movie]?>
    
    /**
     Fetches movie details for single movieId from themoviedb.org api
     
     - Parameter movieId: unique movie identifier (id)
     - Returns: Optional observable of 'Movie' type
     */
    func fetchMovieDetails(for movieId: Int) -> Observable<Movie?>

    /**
     Fetches movie videos for single movieId from themoviedb.org api

     - Parameter movieId: unique movie identifier (id)
     - Returns: Optional observable array of 'Video' type
     */
    func fetchMovieVideos(for movieId: Int) -> Observable<[Video]?>

    /**
     Fetches custom requested movies from themoviedb.org api
     
     - Parameter query: movie query string
     - Returns: Optional observable array of 'Movie' type
     */
    func searchMovies(for query: String) -> Observable<[Movie]?>
}
