//
//  MainCoordinator.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-13.
//

import UIKit

class MainCoordinator: BaseCoordinator, Navigator {
        
    // MARK: init
    private weak var navigationController: UINavigationController?

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: child view controllers
    private var homeViewController: HomeViewController?
    
    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .home:
            if homeViewController == nil {
                homeViewController = HomeViewController()
            }
            return homeViewController!
        }
    }
    
    // MARK: navigate
    enum Destination {
        case home
    }
    
    func navigate(to destination: Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.setViewControllers([viewController], animated: true) // remove previous controller 
        //navigationController?.pushViewController(viewController, animated: true)
    }

    // MARK: flow
    override func start() {
        navigate(to: .home)
    }
}
