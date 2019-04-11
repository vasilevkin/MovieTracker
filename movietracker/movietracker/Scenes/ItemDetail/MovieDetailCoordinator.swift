//
//  MovieDetailCoordinator.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 06/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

final class MovieDetailCoordinator: ItemDetailCoordinatable {

    internal let navigationController: UINavigationController
    private var childCoordinators = [MovieDetailCoordinatorChild: Coordinatable]()
    weak var delegate: MovieDetailCoordinatorDelegate?
    var itemId: Int?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        itemId =  self.delegate?.movieId

        if let movieId = itemId,
            movieId != 0 {
            dLog("MovieDetailCoordinator:: start with itemId = \(movieId)")

            let itemDetailViewModel = ItemDetailViewModel(dependencies:
                ItemDetailViewModel.Dependencies(itemDetailType: .movie, itemId: movieId, api: ApiThemoviedb(), coordinator: self))
            let itemDetailViewController = UIStoryboard.main.itemDetailViewController

            itemDetailViewController.viewModel = itemDetailViewModel
            navigationController.show(itemDetailViewController, sender: nil)
        } else {
            dLog("MovieDetailCoordinator:: Initial Item Id is required for details flow")
            dLog("MovieDetailCoordinator:: Implement movieId in MovieDetailCoordinatorDelegate")
            goBack()
        }
    }

    func goBack() {
        dLog("MovieDetailCoordinator:: invoke movieDetailCoordinatorDidFinish")

        self.delegate?.movieDetailCoordinatorDidFinish()
    }

}
