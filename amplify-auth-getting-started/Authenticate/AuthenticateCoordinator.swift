//
//  LoginNavigator.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-10.
//

import UIKit
import Amplify


protocol AuthenticateCoordinatorDelegate: class {
    func authenticateCompleted(success: Bool)
}

class AuthenticateCoordinator: BaseCoordinator, Navigator, SignInViewControllerDelegate, SignUpViewControllerDelegate, SignUpConfirmationViewControllerDelegate {
    
    // MARK: delegation
    weak var delegate: AuthenticateCoordinatorDelegate?
    
    // MARK: init
    // In most cases it's totally safe to make this a strong
    // reference, but in some situations it could end up
    // causing a retain cycle, so better be safe than sorry :)
    private weak var navigationController: UINavigationController?
    private let viewControllerFactory: AuthenticateViewControllerFactory
    private let viewModelFactory: AuthenticateViewModelFactory

    init(navigationController: UINavigationController,
         viewControllerFactory: AuthenticateViewControllerFactory,
         viewModelFactory: AuthenticateViewModelFactory) {
        self.navigationController = navigationController
        self.viewControllerFactory = viewControllerFactory
        self.viewModelFactory = viewModelFactory
    }
    
    // MARK: child view controllers
    private var signUpViewController: SignUpViewController?
    private var signUpConfirmationViewController: SignUpConfirmationViewController?
    private var signInViewController: SignInViewController?
    
    private func makeViewController(for destination: Destination) -> UIViewController {
        switch destination {
        case .signIn:
            if signInViewController == nil {
                signInViewController = viewControllerFactory.makeSignInViewController()
                signInViewController?.delegate = self
            }
            return signInViewController!
            
        case .signUp:
            if signUpViewController == nil {
                signUpViewController = viewControllerFactory.makeSignUpViewController()
                signUpViewController?.delegate = self
            }
            return signUpViewController!
            
        case .signUpConfirmation:
            if signUpConfirmationViewController == nil {
                signUpConfirmationViewController = viewControllerFactory.makeSignUpConfirmationViewController()
                signUpConfirmationViewController?.delegate = self
            }
            return signUpConfirmationViewController!
        }
    }
    
    // MARK: navigate
    // Here we define a set of supported destinations using an
    // enum, and we can also use associated values to add support
    // for passing arguments from one screen to another.
    enum Destination {
        case signIn
        case signUp
        case signUpConfirmation
    }
    
    func navigate(to destination: Destination) {
        let viewController = makeViewController(for: destination)
        navigationController?.pushViewController(viewController, animated: true)
    }

    // MARK: flow
    override func start() {
        checkAuthStatus()
    }

    // MARK: events
    func signIn(viewController: SignInViewController, username: String, password: String) {
        Amplify.Auth.signIn(username: username, password: password) { [unowned self, unowned viewController] result in
            switch result {
            case .success:
                print("Sign in succeeded")
                DispatchQueue.main.async {
                    self.delegate?.authenticateCompleted(success: true)
                }
            case .failure(let error):
                print("Sign in failed \(error)")
                DispatchQueue.main.async {
                    viewController.recoverySuggesionLabel.text = error.recoverySuggestion
                }
            }
        }
    }
    
    func signUp(viewController: SignUpViewController, username: String, email: String, password: String) {
        // auth service
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        Amplify.Auth.signUp(username: username, password: password, options: options) { [unowned viewController, unowned self] result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                    print("Switch to confirmation login form")
                    DispatchQueue.main.async {
                        self.navigate(to: .signUpConfirmation)
                        self.signUpConfirmationViewController?.loginView.usernameTextField.textField.text = username
                    }
                } else {
                    print("SignUp Complete")
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
                DispatchQueue.main.async {
                    viewController.recoverySuggesionLabel.text = error.recoverySuggestion
                }
            }
        }
    }
    
    func confirmSignUp(viewController: SignUpConfirmationViewController, username: String, code: String) {
        // auth service
        Amplify.Auth.confirmSignUp(for: username, confirmationCode: code) { [unowned self] result in
            switch result {
            case .success:
                print("Confirm signUp succeeded")
                DispatchQueue.main.async {
                    self.navigate(to: .signIn)
                    self.signInViewController?.loginView.usernameTextField.textField.text = username
                }
            case .failure(let error):
                print("An error occurred while confirming sign up \(error)")
            }
        }
    }
    
    func switchToSignIn(viewController: SignUpViewController) {
        let signInviewController = makeViewController(for: .signIn)
        self.navigationController?.setViewControllers([signInviewController], animated: true)
    }
    
    // MARK: move to navigation extension
    func removeLastViewControllerFromNavigationController() {
        guard let navigationController = self.navigationController else { return }
        var navigationArray = navigationController.viewControllers // To get all UIViewController stack as Array
        navigationArray.remove(at: navigationArray.count - 1) // To remove previous UIViewController
        self.navigationController?.viewControllers = navigationArray
    }

    // MARK: - auth service
    func checkAuthStatus() {
        Amplify.Auth.fetchAuthSession { [unowned self] (result) in
            switch result {
            case .success(let authSession):
                if authSession.isSignedIn {
                    print("user is signed in")
                    self.signOutLocally()
                } else {
                    print("user is signed out")
                    DispatchQueue.main.async {
                        self.navigate(to: .signUp)
                    }
                }
                break
            
            case .failure(let authError):
                print("Failed to fetch auth session! details:", authError)
                break
            }
        }
    }
    
    func signOutLocally() {
        Amplify.Auth.signOut() { [unowned self] result in
            switch result {
            case .success:
                print("Successfully signed out")
                DispatchQueue.main.async {
                    self.navigate(to: .signIn)
                }
                
            case .failure(let error):
                print("Sign out failed with error \(error)")
                DispatchQueue.main.async {
                    self.navigate(to: .signUp)
                }
            }
        }
    }

}
