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
     Navigation controller for current coordinator.
     
     A container view controller that defines a stack-based scheme for navigating hierarchical content.
     */
    var navigationController: UINavigationController { get }
    
    /**
     Required init
     
     - Parameter navigationController: container view controller
     */
    init(navigationController: UINavigationController)
}
