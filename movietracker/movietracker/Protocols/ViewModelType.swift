//
//  ViewModelType.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 29/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation

/**
 Type to describe view model
 
 Consists of:
 
 Input: struct describing input parameters
 
 Output: struct describing output parameters
 
 Dependencies: services required for correct data processing inside a view model
 
 Transform: transforming method
 */
protocol ViewModelType {
    /**
     Input parameters
     */
    associatedtype Input
    
    /**
     Output parameters
     */
    associatedtype Output
    
    /**
     Services required for correct data processing inside a view model
     */
    associatedtype Dependencies
    
    /**
     Get input and transforms it to output specific for view controller
     
     - Parameter input: struct describing input parameters
     - Returns: struct describing output parameters
     */
    func transform(input: Input) -> Output
}
