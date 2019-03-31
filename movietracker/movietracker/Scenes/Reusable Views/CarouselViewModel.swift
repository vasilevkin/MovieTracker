//
//  CarouselViewModel.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 29/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

struct CarouselViewModel {
    let title: String
    let subtitle: String
    let items: [CarouselItemViewModel]
}

extension CarouselViewModel {
    
    init?(movies: [Movie]?) {
        guard let movies = movies else {
            dLog("Unexpectedly found nil")
            return nil
        }
        self.title = "Popular movies"
        self.subtitle = "Most popular in the world"
        self.items = movies
            .map {
                CarouselItemViewModel(movie: $0)
        }
    }
    
    init?(tvShows: [TVShow]?) {
        guard let tvShows = tvShows else {
            dLog("Unexpectedly found nil")
            return nil
        }
        self.title = "TV shows"
        self.subtitle = "Recent updates on popular TV shows"
        self.items = tvShows
            .map {
                CarouselItemViewModel(tvShow: $0)
        }
    }

}
