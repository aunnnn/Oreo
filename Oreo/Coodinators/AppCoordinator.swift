//
//  AppCoordinator.swift
//  Oreo
//
//  Created by Wirawit Rueopas on 3/3/2561 BE.
//  Copyright © 2561 Wirawit Rueopas. All rights reserved.
//

import UIKit

class AppCoordinator: RootViewControllerProvider {
    
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return tabBarController
    }
    
    private let tabBarController: UITabBarController
    
    init(window: UIWindow) {
        let tabBar = UITabBarController()
        self.tabBarController = tabBar
        tabBar.viewControllers = [ViewController()]
        window.rootViewController = tabBar
    }
    
    func start() {
        
    }
}
