//
//  ItemDetailCoordinatable.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 02/04/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

/**
 Coordinator for all transitions on Item Detail scene
 */
protocol ItemDetailCoordinatable: Coordinatable {
    /**
     Initial Item Id. Required for details flow to work correctly.
     */
    var itemId: Int? { get set }
}

// MARK: - MovieDetailCoordinator childs and delegate protocol

/**
 Possible child coordinators for MovieDetailCoordinator.
 */
enum MovieDetailCoordinatorChild: Hashable {

}

/**
 Parent delegate protocol for MovieDetailCoordinator.
 Should be implemented by parent Coordinator who invoked MovieDetailCoordinator.
 */
protocol MovieDetailCoordinatorDelegate: AnyObject {

    /**
     Initial Movie Id. Required for details flow to work correctly.
     */
    var movieId: Int? { get }

    /**
     Invoked when the movie detail flow is no longer needed
     Coordinator never finishes by itself,
     but calls its Parent Coordinator only when it finished work.
     */
    func movieDetailCoordinatorDidFinish()

}

// MARK: - TVShowDetailCoordinator childs and delegate protocol

/**
 Possible child coordinators for TVShowDetailCoordinator.
 */
enum TVShowDetailCoordinatorChild: Hashable {

}

/**
 Parent delegate protocol for TVShowDetailCoordinator.
 Should be implemented by parent Coordinator who invoked TVShowDetailCoordinator.
 */
protocol TVShowDetailCoordinatorDelegate: AnyObject {

    /**
     Initial TV Show Id. Required for details flow to work correctly.
     */
    var tvShowId: Int? { get }

    /**
     Invoked when the tv show detail flow is no longer needed
     Coordinator never finishes by itself,
     but calls its Parent Coordinator only when it finished work.
     */
    func tvShowDetailCoordinatorDidFinish()

}
