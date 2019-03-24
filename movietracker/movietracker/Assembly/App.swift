//
//  App.swift
//  movietracker
//
//  Created by Sergey Vasilevkin on 24/03/2019.
//  Copyright © 2019 Sergey Vasilevkin. All rights reserved.
//

import UIKit

final class App {
    
    static let shared = App()
    
    func startInterface(in window: UIWindow) {
        let featuredNavigationController = UINavigationController()
        let featuredViewController = UIStoryboard.main.featuredViewController
        
        featuredNavigationController.viewControllers = [featuredViewController]
        
        window.rootViewController = featuredViewController
        window.makeKeyAndVisible()
    }
}
