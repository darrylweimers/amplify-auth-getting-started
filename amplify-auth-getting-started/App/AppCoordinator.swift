//
//  AppCoordinator.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-13.
//

import UIKit

class AppCoordinator: BaseCoordinator, Navigator, AuthenticateCoordinatorDelegate {

    // MARK: init
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        super.init()
        
        self.start()
    }
    
    // MARK: navigate
    enum Destination {
        case main
        case authenticate
    }
    
    // MARK: coordinators
    private var mainCoordinator: MainCoordinator?
    private var authenticateCoordinator: AuthenticateCoordinator?

    func makeCoordinator(for destination: Destination) -> Coordinator {
        switch(destination) {
        case .main:
            if mainCoordinator == nil {
                mainCoordinator = MainCoordinator(navigationController: navigationController!)
            }
            return mainCoordinator!
            
        case .authenticate:
            if authenticateCoordinator == nil {
                authenticateCoordinator = AuthenticateCoordinator(navigationController: navigationController!, viewControllerFactory: authenticateViewControllerFactory, viewModelFactory: authenticateViewModelFactory)
                authenticateCoordinator?.delegate = self
            }
            return authenticateCoordinator!
        }
    }
    
    // MARK: flow
    override func start() {
        let coordinator = makeCoordinator(for: .authenticate)
        coordinator.start()
    }
    
    // MARK: authenticate
    private lazy var authenticateViewModelFactory: AuthenticateViewModelFactory = {
        return AuthenticateViewModelFactory()
    }()
    
    private lazy var authenticateViewControllerFactory: AuthenticateViewControllerFactory = {
        return AuthenticateViewControllerFactory(viewModelFactory: authenticateViewModelFactory)
    }()

    // MARK: authenticate events
    func authenticateCompleted(success: Bool) {
        print("****authenticateCompleted")
        authenticateCoordinator = nil
        let coordinator = makeCoordinator(for: .main)
        coordinator.start()
    }
}
