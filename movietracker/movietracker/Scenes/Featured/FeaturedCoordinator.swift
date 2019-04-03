//
//  FeaturedCoordinator.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 31/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

final class FeaturedCoordinator: FeaturedCoordinatable {
    
    internal let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func navigateToMovieDetailScene(with movieId: Int, api: ApiThemoviedbService) {
        
    }
    
    func navigateToTVShowDetailScene(with tvShowId: Int, api: ApiThemoviedbService) {
        
    }
    
}
