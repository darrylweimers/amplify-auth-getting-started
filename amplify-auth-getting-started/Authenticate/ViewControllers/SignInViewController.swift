//
//  SignInController.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-10.
//

import UIKit

protocol SignInViewControllerDelegate: class {
    func signIn(viewController: SignInViewController, username: String, password: String)
}

class SignInViewController : LoginController {
    
    weak var delegate: SignInViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.loginButton.addTarget(self, action: #selector(signInButtonTapped(button:)), for: .touchUpInside)
    }
    
    // MARK: events
    @objc func signInButtonTapped(button: UIButton) {
        guard let username = loginView.usernameTextField.textField.text,
              let password = loginView.passwordTextField.textField.text else {
            return
        }
        delegate?.signIn(viewController: self, username: username, password: password)
    }
}
