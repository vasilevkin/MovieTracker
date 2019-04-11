//
//  ApplicationCoordinator.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 06/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit
#if !RX_NO_MODULE
import RxSwift
#endif

/**
 Possible child coordinators for ApplicationCoordinator.
 */
enum ApplicationCoordinatorChild {
    case featured
    case login
}

class ApplicationCoordinator: Coordinatable {

    internal let navigationController: UINavigationController
    private let window: UIWindow
    private var childCoordinators = [ApplicationCoordinatorChild: Coordinatable]()

    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.window = UIWindow()
    }

    init(with window: UIWindow) {
        navigationController = UINavigationController()
        self.window = window
    }

    func start() {
        dLog("ApplicationCoordinator:: start app")

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

// Commented out because authToken and Login are not implemented yet.
//        if settingsService.authToken {
            showFeaturedMainScene()
//        } else {
//            showLoginScene()
//        }
    }

    func goBack() {
        // Just a Coordinatable protocol stub.
        // ApplicationCoordinator is the root coordinator.
    }

    // MARK: - Private

    private func showFeaturedMainScene() {
        dLog("MovieDetailCoordinator:: start FeaturedCoordinator")

        let featuredCoordinator = FeaturedCoordinator(navigationController: navigationController)

        childCoordinators[.featured] = featuredCoordinator
        featuredCoordinator.delegate = self

        featuredCoordinator.start()
    }

    private func showLoginScene() {
        // Login is not implemented yet.
    }

}

extension ApplicationCoordinator: FeaturedCoordinatorDelegate {

    /**
     Invoked when the featured flow is no longer needed.
     */
    func featuredCoordinatorDidFinish() {
        dLog("ApplicationCoordinator:: childCoordinators[.featured] = nil")

        childCoordinators[.featured] = nil
        navigationController.popViewController(animated: true)

        dLog("ApplicationCoordinator:: childCoordinators = \(childCoordinators)")

        showLoginScene()
    }

}
