//
//  SignUpController.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-10.
//

import UIKit

protocol SignUpViewControllerDelegate: class {
    func signUp(viewController: SignUpViewController, username: String, email: String, password: String)
    func switchToSignIn(viewController: SignUpViewController)
}

class SignUpViewController : LoginController {
    
    weak var delegate: SignUpViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.loginButton.addTarget(self, action: #selector(signUpButtonTapped(button:)), for: .primaryActionTriggered)
        self.toggleLoginView.button.addTarget(self, action: #selector(switchToSignIn(button:)), for: .primaryActionTriggered)
    }
    
    // MARK: events
    @objc func signUpButtonTapped(button: UIButton) {
        guard let username = loginView.usernameTextField.textField.text,
              let email = loginView.emailTextField.textField.text,
              let password = loginView.passwordTextField.textField.text else {
            return
        }
        delegate?.signUp(viewController: self, username: username, email: email, password: password)
    }
    
    @objc func switchToSignIn(button: UIButton) {
        delegate?.switchToSignIn(viewController: self)
    }
    
}
