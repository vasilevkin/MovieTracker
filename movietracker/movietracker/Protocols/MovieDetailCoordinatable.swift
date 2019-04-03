//
//  MovieDetailCoordinatable.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 02/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

/**
 Coordinator for all transitions on Movie Detail scene
 */
protocol MovieDetailCoordinatable: Coordinatable {
    /**
     Transition back to the presenting View Controller
     */
    func goBack()
}
