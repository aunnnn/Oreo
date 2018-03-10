//
//  AppCoordinator.swift
//  Oreo
//
//  Created by Wirawit Rueopas on 3/2/2561 BE.
//  Copyright © 2561 Wirawit Rueopas. All rights reserved.
//

import Foundation

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
}

extension Coordinator {
    func addChildCoordinator(_ child: Coordinator) {
        self.childCoordinators.append(child)
    }
    
    func removeChildCoordinator(_ child: Coordinator) {
        self.childCoordinators = self.childCoordinators.filter { $0 !== child }
    }
}
