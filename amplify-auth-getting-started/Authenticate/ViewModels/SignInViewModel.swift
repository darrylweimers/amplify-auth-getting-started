//
//  SignInViewModel.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-13.
//

import UIKit


struct SignInViewModel {
    
    // MARK: - stored properties
    let data: LoginData = {
        let loginData = LoginData(title: "Paste Board",
                                  message: "Welcome back.",
                                  usernamePlaceholder: "Enter your username",
                                  emailPlaceholder: "Enter your email address",
                                  passwordPlaceholder: "Enter your password",
                                  usernameIcon: UIImage(systemName: "person"),
                                  emailIcon: UIImage(systemName: "envelope"),
                                  passwordIcon: UIImage(systemName: "lock"),
                                  loginButtonTitle: "Sign in",
                                  termsAndConditions: nil)
        return loginData
    }()
    
    let type: LoginFormType = .signIn
}
