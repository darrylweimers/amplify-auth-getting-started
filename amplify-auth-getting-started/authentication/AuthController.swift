//
//  ViewController.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-01-23.
//

import UIKit
import UtilityKit
import Amplify

class AuthController: UIViewController {
    
    // MARK: controllers and view model
    private lazy var viewModel: LoginViewModel = LoginViewModel()
    private lazy var loginController: LoginController = {
        let controller = LoginController(loginData: viewModel.loginData, loginForm: viewModel.formType)
        controller.loginView.loginButton.addTarget(self, action: #selector(didTapLoginButton(button:)), for: .primaryActionTriggered)
        return controller
    }()
    
    // MARK: update login form
    public var loginForm: LoginFormType {
        set(formType) {
            viewModel.formType = formType
            self.loginController.updateContent(with: viewModel.loginData, and: viewModel.formType)
        }
        get {
            return viewModel.formType
        }
    }
    
    // MARK: - setup
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginForm = .signUp
        // Do any additional setup after loading the view.
        checkAuthStatus()
    }
    
    // MARK: login button delegation
    @objc func didTapLoginButton(button: UIButton) {
        
        switch viewModel.formType {
 
        case .signIn:
            break
        case .signUp:
            guard let username = loginController.loginView.usernameTextField.textField.text,
                  let password = loginController.loginView.passwordTextField.textField.text,
                  let email = loginController.loginView.emailTextField.textField.text else {
                return
            }
            signUp(username: username, password: password, email: email)
        case .signUpConfirmation:
            guard let username = loginController.loginView.usernameTextField.textField.text,
                  let pin = loginController.loginView.passwordTextField.textField.text else {
                return
            }
            confirmSignUp(for: username, with: pin)
        }
    }
    
    // MARK: - auth service
    func checkAuthStatus() {
        Amplify.Auth.fetchAuthSession { [unowned self] (result) in
            switch result {
            case .success(let authSession):
                if authSession.isSignedIn {
                    print("user is signed in")
                    // TODO: display app; in our case, show sign in message
                } else {
                    print("user is signed out")
                    DispatchQueue.main.async {
                        self.loginForm = .signUp
                        self.add(self.loginController)
                    }
                }
                break
            
            case .failure(let authError):
                print("Failed to fetch auth session! details:", authError)
                break
            }
        }
    }
    
    func signUp(username: String, password: String, email: String) {
        let userAttributes = [AuthUserAttribute(.email, value: email)]
        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
        Amplify.Auth.signUp(username: username, password: password, options: options) { [unowned self] result in
            switch result {
            case .success(let signUpResult):
                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                    print("Delivery details \(String(describing: deliveryDetails))")
                    print("Switch to confirmation login form")
                    DispatchQueue.main.async {
                        self.loginForm = .signUpConfirmation
                    }
                } else {
                    print("SignUp Complete")
                }
            case .failure(let error):
                print("An error occurred while registering a user \(error)")
                DispatchQueue.main.async {
                    self.loginController.recoverySuggesionLabel.text = error.recoverySuggestion
                }
            }
        }
    }
    
    func confirmSignUp(for username: String, with confirmationCode: String) {
        Amplify.Auth.confirmSignUp(for: username, confirmationCode: confirmationCode) { result in
            switch result {
            case .success:
                print("Confirm signUp succeeded")
            case .failure(let error):
                print("An error occurred while confirming sign up \(error)")
            }
        }
    }
}
