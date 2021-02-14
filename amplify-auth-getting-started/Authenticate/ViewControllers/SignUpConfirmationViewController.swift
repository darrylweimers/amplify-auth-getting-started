//
//  SignUpConfirmationViewController.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-13.
//

import UIKit

protocol SignUpConfirmationViewControllerDelegate: class {
    func confirmSignUp(viewController: SignUpConfirmationViewController, username: String, code: String)
}

class SignUpConfirmationViewController : LoginController {
    
    weak var delegate: SignUpConfirmationViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loginView.loginButton.addTarget(self, action: #selector(confirmButtonTapped(button:)), for: .touchUpInside)
    }
    
    // MARK: events
    @objc func confirmButtonTapped(button: UIButton) {
        guard let username = loginView.usernameTextField.textField.text,
              let code = loginView.passwordTextField.textField.text else {
            return
        }
        delegate?.confirmSignUp(viewController: self, username: username, code: code)
    }
    
}
