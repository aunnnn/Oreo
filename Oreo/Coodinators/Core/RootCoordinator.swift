//
//  RootCoordinator.swift
//  Oreo
//
//  Created by Wirawit Rueopas on 3/3/2561 BE.
//  Copyright © 2561 Wirawit Rueopas. All rights reserved.
//

import UIKit

protocol RootViewControllerProvider: class {
    var rootViewController: UIViewController { get }
}

typealias RootViewCoordinator = Coordinator & RootViewControllerProvider
