//
//  Constants.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 27/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import Foundation
import UIKit

/**
 All public constants in plain text.
 */
struct Constants {
    
    // UI Constants
    static let uiMainTabBarBarTintColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1.0)
    static let uiMainTabBarTintColor = UIColor.white
    
    static let uiCarouselSectionTableViewCellWidth: CGFloat = 140
    static let uiCarouselSectionTableViewCellHeight: CGFloat = 235
    
    static let uiCollectionViewContentInset: CGFloat = 20
    
    static let uiMovieCellMaxHeight: CGFloat = 400
    
    static let uiFeaturedMainViewItemsPerRow: CGFloat = 4
    
    static let uiGradientImageViewBackgroundColor = UIColor.black
    static let uiGradientImageViewOpacity: Float = 0.1
    static let uiGradientImageViewGradientColors = [UIColor.clear.cgColor,
                                                    UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1.0).cgColor,
                                                    UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1.0).cgColor,
                                                    UIColor.clear.cgColor]
    static let uiGradientImageViewGradientLocations: [NSNumber] = [0, 0.1, 0.9, 1]
    
}
