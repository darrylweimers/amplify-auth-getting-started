//
//  SignUpConfirmationViewModel.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-13.
//

import UIKit

struct SignUpConfirmationViewModel {
    
    // MARK: - stored properties
    let data: LoginData = {
        let loginData = LoginData(title: "Paste Board",
                                  message: "Confirm your account",
                                  usernamePlaceholder: "Enter your username",
                                  emailPlaceholder: "Enter your email address",
                                  passwordPlaceholder: "Enter your confirmation code",
                                  usernameIcon: UIImage(systemName: "person"),
                                  emailIcon: UIImage(systemName: "envelope"),
                                  passwordIcon: UIImage(systemName: "lock"),
                                  loginButtonTitle: "Confirm",
                                  termsAndConditions: nil)
        return loginData
    }()
    
    let type: LoginFormType = .signUpConfirmation
}
