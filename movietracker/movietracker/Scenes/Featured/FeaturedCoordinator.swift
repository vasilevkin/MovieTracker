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
    private var childCoordinators = [FeaturedCoordinatorChild: Coordinatable]()
    weak var delegate: FeaturedCoordinatorDelegate?
    var movieID: Int?
    var tvShowID: Int?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        dLog("FeaturedCoordinator:: start")

        let featuredViewModel = FeaturedViewModel(dependencies:
            FeaturedViewModel.Dependencies(api: ApiThemoviedb(), coordinator: self))
        let featuredViewController = UIStoryboard.main.featuredViewController

        featuredViewController.viewModel = featuredViewModel
        navigationController.pushViewController(featuredViewController, animated: false)
    }

    func goBack() {
        dLog("FeaturedCoordinator:: invoke featuredCoordinatorDidFinish")

        self.delegate?.featuredCoordinatorDidFinish()
    }
    
    func navigateToMovieDetailScene(with movieId: Int, api: ApiThemoviedbService) {
        movieID = movieId

        if let movieID = movieID,
            movieID != 0 {
            dLog("FeaturedCoordinator:: start MovieDetailCoordinator with movieID = \(movieID)")
        } else {
            dLog("FeaturedCoordinator:: start MovieDetailCoordinator with movieID = nil or 0")
        }

        let movieDetailCoordinator = MovieDetailCoordinator(navigationController: navigationController)

        childCoordinators[.movieDetail] = movieDetailCoordinator
        movieDetailCoordinator.delegate = self
        movieDetailCoordinator.start()
    }
    
    func navigateToTVShowDetailScene(with tvShowId: Int, api: ApiThemoviedbService) {

    }

}

extension FeaturedCoordinator: MovieDetailCoordinatorDelegate {

    var movieId: Int? {
        return self.movieID
    }

    func movieDetailCoordinatorDidFinish() {
        dLog("FeaturedCoordinator:: childCoordinators[.movieDetail] = nil")

        childCoordinators[.movieDetail] = nil
        navigationController.popViewController(animated: true)

        dLog("FeaturedCoordinator:: childCoordinators = \(childCoordinators)")
    }

}
