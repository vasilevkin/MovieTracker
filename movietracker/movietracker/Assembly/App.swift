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
        let featuredViewModel = FeaturedViewModel(dependencies: FeaturedViewModel.Dependencies(api: ApiThemoviedb()))
        let featuredViewController = UIStoryboard.main.featuredViewController
        featuredViewController.viewModel = featuredViewModel
        featuredNavigationController.viewControllers = [featuredViewController]
        
        let tabBarController = UITabBarController()
        tabBarController.tabBar.barTintColor = Constants.uiMainTabBarBarTintColor
        tabBarController.tabBar.tintColor = Constants.uiMainTabBarTintColor
        
        featuredNavigationController.tabBarItem = UITabBarItem(title: "Featured", image: nil, selectedImage: nil)
        featuredNavigationController.viewControllers = [featuredViewController]
        
        tabBarController.viewControllers = [
            featuredNavigationController
        ]

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
    }
}
