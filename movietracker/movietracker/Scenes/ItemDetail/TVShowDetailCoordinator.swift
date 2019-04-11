//
//  TVShowDetailCoordinator.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 11/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

final class TVShowDetailCoordinator: ItemDetailCoordinatable {

    internal let navigationController: UINavigationController
    private var childCoordinators = [TVShowDetailCoordinatorChild: Coordinatable]()
    weak var delegate: TVShowDetailCoordinatorDelegate?
    var itemId: Int?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        itemId =  self.delegate?.tvShowId

        if let tvShowId = itemId,
            tvShowId != 0 {
            dLog("TVShowDetailCoordinator:: start with itemId = \(tvShowId)")

            let itemDetailViewModel = ItemDetailViewModel(dependencies:
                ItemDetailViewModel.Dependencies(itemDetailType: .tvShow, itemId: tvShowId, api: ApiThemoviedb(), coordinator: self))
            let itemDetailViewController = UIStoryboard.main.itemDetailViewController

            itemDetailViewController.viewModel = itemDetailViewModel
            navigationController.show(itemDetailViewController, sender: nil)
        } else {
            dLog("TVShowDetailCoordinator:: Initial Item Id is required for details flow")
            dLog("TVShowDetailCoordinator:: Implement tvShowId in TVShowDetailCoordinatorDelegate")
            goBack()
        }
    }

    func goBack() {
        dLog("TVShowDetailCoordinator:: invoke tvShowDetailCoordinatorDidFinish")

        self.delegate?.tvShowDetailCoordinatorDidFinish()
    }

}
