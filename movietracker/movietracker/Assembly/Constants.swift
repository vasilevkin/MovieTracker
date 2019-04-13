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
    static let uiTitleTextColor     = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
    static let uiSubtitleTextColor  = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 0.8)

    // Subviews constants
    static let uiSubviewTitleTextColor       = UIColor.white
    static let uiSubviewSubtitleTextColor    = UIColor.lightGray
    static let uiSubviewTitleFont: UIFont    = UIFont.systemFont(ofSize: 14)
    static let uiSubviewSubtitleFont: UIFont = UIFont.systemFont(ofSize: 12)

    // Main tab bar constants
    static let uiMainTabBarBarTintColor = UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1.0)
    static let uiMainTabBarTintColor    = UIColor.white

    // Reusable views constants
    static let uiCarouselSectionTableViewCellWidth: CGFloat  = 140
    static let uiCarouselSectionTableViewCellHeight: CGFloat = 235
    
    static let uiCollectionViewContentInset: CGFloat  = 20
    static let uiFeaturedMainViewItemsPerRow: CGFloat = 4

    static let uiMovieCellMaxHeight: CGFloat    = 400
    static let uiMovieCellCornerRadius: CGFloat = 16
    static let uiMovieCellTitleFont: UIFont     = UIFont.boldSystemFont(ofSize: 10)
    static let uiMovieCellSubtitleFont: UIFont  = UIFont.systemFont(ofSize: 8)

    // Poster view constants
    static let uiGradientImageViewBackgroundColor = UIColor.black
    static let uiGradientImageViewOpacity: Float  = 0.1
    static let uiGradientImageViewGradientColors = [UIColor.clear.cgColor,
                                                    UIColor(red: 35/255, green: 35/255, blue: 35/255, alpha: 1.0).cgColor,
                                                    UIColor(red: 18/255, green: 18/255, blue: 18/255, alpha: 1.0).cgColor,
                                                    UIColor.clear.cgColor]
    static let uiGradientImageViewGradientLocations: [NSNumber] = [0, 0.1, 0.9, 1]

}
