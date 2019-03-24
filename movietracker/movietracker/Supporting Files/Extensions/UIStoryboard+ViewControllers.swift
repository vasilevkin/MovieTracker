//
//  UIStoryboard+ViewControllers.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 24/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static var main: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
}

extension UIStoryboard {
    var featuredViewController: FeaturedViewController {
        guard let viewController =
            UIStoryboard.main.instantiateViewController(withIdentifier:
                "FeaturedViewController") as? FeaturedViewController else {
                    fatalError("FeaturedViewController couldn't be found in Storyboard file")
        }
        return viewController
    }
}
