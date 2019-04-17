//
//  ApiThemoviedbTVShowsProvider.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 07/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

#if !RX_NO_MODULE
import RxSwift
import RxCocoa
#endif

/**
 Gets tv shows data from themoviedb.org api
 */
protocol ApiThemoviedbTVShowsProvider {
    /**
     Fetches popular tv shows from themoviedb.org api

     - Returns: Optional observable array of 'TVShow' type
     */
    func fetchPopularTVShows() -> Observable<[TVShow]?>

    /**
     Fetches tv show details for single tvShowId from themoviedb.org api

     - Parameter tvShowId: unique tv show identifier (id)
     - Returns: Optional observable of 'TVShow' type
     */
    func fetchTVShowDetails(for tvShowId: Int) -> Observable<TVShow?>

    /**
     Fetches tv show videos for single tvShowId from themoviedb.org api

     - Parameter tvShowId: unique tv show identifier (id)
     - Returns: Optional observable array of 'Video' type
     */
    func fetchTVShowVideos(for tvShowId: Int) -> Observable<[Video]?>

    /**
     Fetches custom requested tv shows from themoviedb.org api

     - Parameter query: tv show query string
     - Returns: Optional observable array of 'TVShow' type
     */
    func searchTVShows(for query: String) -> Observable<[TVShow]?>
}
