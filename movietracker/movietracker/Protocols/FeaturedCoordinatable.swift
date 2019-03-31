//
//  FeaturedCoordinatable.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 31/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

/**
 Coordinator for all transitions on Featured scene
 */
protocol FeaturedCoordinatable: Coordinatable {
    /**
     Transition to Movie detail scene
     
     - Parameter movieId: unique movie identifier (id)
     - Parameter api: service to provide all required detail data
     */
    func navigateToMovieDetailScene(with movieId: Int, api: ApiThemoviedbService)
    
    /**
     Transition to TV Show detail scene
     
     - Parameter tvShowId: unique tv show identifier (id)
     - Parameter api: service to provide all required detail data
     */
    func navigateToTVShowDetailScene(with tvShowId: Int, api: ApiThemoviedbService)
}
