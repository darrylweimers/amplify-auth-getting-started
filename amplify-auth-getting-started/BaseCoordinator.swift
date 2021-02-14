//
//  BaseCoordinator.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-13.
//

import Foundation

class BaseCoordinator: NSObject, Coordinator {

    // MARK: - coordinator
    var childCoordinators = [Coordinator]()
    
    func addCoordinator(_ coordinator: Coordinator) {
        for element in childCoordinators {
            if element === coordinator {
                return
            }
        }
        childCoordinators.append(coordinator)
    }
    
    func removeCoordinator(_ coordinator: Coordinator?) {
        guard childCoordinators.isEmpty == false,
              let coordinator = coordinator else {
            return
        }
        
        for (index, element) in childCoordinators.enumerated() {
            if element === coordinator {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    // MARK: - spawn coordinator or view controllers
    func start() {
        
    }
}
