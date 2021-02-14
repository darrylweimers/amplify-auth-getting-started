//
//  SignUpViewModel.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-13.
//

import UIKit

struct SignUpViewModel {
    
    // MARK: - stored properties
    let data: LoginData = {
        let loginData = LoginData(title: "Paste Board",
                                  message: "Join us.",
                                  usernamePlaceholder: "Enter your username",
                                  emailPlaceholder: "Enter your email address",
                                  passwordPlaceholder: "Enter your password",
                                  usernameIcon: UIImage(systemName: "person"),
                                  emailIcon: UIImage(systemName: "envelope"),
                                  passwordIcon: UIImage(systemName: "lock"),
                                  loginButtonTitle: "Create account",
                                  termsAndConditions: "By signing up, you agree to out Terms of Service and acknowledge that our Private Policy applies to you.")
        return loginData
    }()
    
    let type: LoginFormType = .signUp
}
