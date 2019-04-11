//
//  Coordinatable.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 31/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

/**
 Base Abstract Coordinator for all coordinators on concrete scenes.
 Based on UINavigationController.
 */
protocol Coordinatable {

    /**
     Navigation controller for a current coordinator.
     
     A container view controller that defines a stack-based scheme for navigating hierarchical content.
     */
    var navigationController: UINavigationController { get }

    /**
     Required init
     
     - Parameter navigationController: container view controller
     */
    init(navigationController: UINavigationController)
    
    /**
     An entry point for coordinator to begin work and navigation.
     */
    func start()

    /**
     Transition back to the presenting View Controller
     */
    func goBack()

}

/**
 Possible child coordinators for Coordinator.
 */
enum CoordinatorChild: Hashable {

}

/**
 Parent delegate protocol for Coordinator.
 Should be implemented by Parent Coordinator who invoked Coordinator.
 */
protocol CoordinatorDelegate: AnyObject {

    /**
     Invoked when the Coordinator is no longer needed
     Coordinator never finishes by itself,
     but calls its Parent Coordinator only when it finished work.
     */
    func coordinatorDidFinish()

}
