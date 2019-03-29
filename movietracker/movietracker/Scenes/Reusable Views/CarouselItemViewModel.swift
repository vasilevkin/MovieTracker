//
//  CarouselItemViewModel.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 29/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

struct CarouselItemViewModel {
    let title: String
    let subtitle: String
    let imageUrl: String?
}

extension CarouselItemViewModel {
    
    init(movie: Movie) {
        self.title = movie.title
        self.subtitle = movie.releaseDate ?? "n/a"
        self.imageUrl = movie.posterPath
            .flatMap {
                "http://image.tmdb.org/t/p/w185/" + $0
        }
    }
    
}
