//
//  ExampleCoordinator.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 07/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

/**
 Abstract Example Coordinator
 Shows how to implement coordinator.
 Never used in production code.
 */
final class ExampleCoordinator: ExampleCoordinatable {

    /**
     Navigation controller for a current coordinator.

     A container view controller that defines a stack-based scheme for navigating hierarchical content.
     */
    internal let navigationController: UINavigationController

    /**
     Dictionary of the child coordinators.

     Every child coordinator should be added to the dictionary in order to keep it in memory.

     - Key: is an enum value of the possible child coordinators for ExampleCoordinator.
     - Value: is a child coordinator itself.
     */
    private var childCoordinators = [ExampleCoordinatorChild: Coordinatable]()

    /**
     Delegate methods should be implemented by Parent Coordinator.
     To inform Parent Coordinator when it finished work or about other actions.
     */
    weak var delegate: ExampleCoordinatorDelegate?

    /**
     Required init

     - Parameter navigationController: container view controller
     */
    required init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    /**
     An entry point for coordinator to begin work and navigation.
     Starts the coordinator.
     */
    func start() {
//        let exampleViewModel = ExampleViewModel(with dependencies)
        let exampleViewController = UIViewController()
//        exampleViewController.viewModel = exampleViewModel
        navigationController.pushViewController(exampleViewController, animated: false)
    }

    /**
     Transition back to the presenting View Controller
     */
    func goBack() {
        dLog("ExampleCoordinator:: invoke exampleCoordinatorDidFinish")

        self.delegate?.exampleCoordinatorDidFinish()
    }

    /**
     Navigation to `child coordinator`.

     1. Parent stores Child coordinator in the dictionary of child coordinators.
     2. Parent calls method `start()` on that Child coordinator.
     3. When Child coordinator finishes, it calls its DidFinish() delegate method.
     4. Parent removes Child coordinator from the dictionary manually.
     5. Parent pops Child viewController from the navigationController.
     */

    func navigateToChild1Scene() {
//        let child1Coordinator = Child1Coordinator(navigationController: navigationController)

//        childCoordinators[.child1] = child1Coordinator
//        child1Coordinator.delegate = self
//        child1Coordinator.start()
    }

    func navigateToChild2Scene(with someId: Int, api: ApiThemoviedbService) {
//        let child2Coordinator = Child2Coordinator(navigationController: navigationController)

//        childCoordinators[.child2] = child2Coordinator
//        child2Coordinator.delegate = self
//        child2Coordinator.start()
    }

}

/**
 Possible child coordinators for ExampleCoordinator.
 */
enum ExampleCoordinatorChild: Hashable {
    case child1
    case child2
}

/**
 Parent delegate protocol for ExampleCoordinator.
 Should be implemented by parent Coordinator who invoked ExampleCoordinator.
 */
protocol ExampleCoordinatorDelegate: AnyObject {

    /**
     Invoked when the Example flow is no longer needed
     Coordinator never finishes by itself,
     but calls its Parent Coordinator only when it finished work.
     */
    func exampleCoordinatorDidFinish()

}

/**
 Coordinator for all transitions on Example scene
 */
protocol ExampleCoordinatable: Coordinatable {

    /**
     Transition to child1 scene
     */
    func navigateToChild1Scene()

    /**
     Transition to child2 scene

     - Parameter someId: unique identifier (id) required for child2 work
     - Parameter api: service to provide all required detail data
     */
    func navigateToChild2Scene(with someId: Int, api: ApiThemoviedbService)

}
