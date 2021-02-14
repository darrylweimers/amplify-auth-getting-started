//
//  Navigator.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-10.
//

import Foundation

protocol Coordinator: class {
    // MARK: coordinators
    var childCoordinators: [Coordinator] {get set}
    func addCoordinator(_ coordinator: Coordinator)
    func removeCoordinator(_ coordinator: Coordinator?)
    
    // MARK: - spawn coordinator or view controllers
    func start()
}
