//
//  LoginViewModel.swift
//  Login
//
//  Created by Darryl Weimers on 2021-02-07.
//

import UIKit

struct LoginViewModel {
    
    // MARK: - stored properties
    private var _loginData: LoginData = {
        let loginData = LoginData(title: "Paste Board", message: "Welcome back.", usernamePlaceholder: "Enter your username", emailPlaceholder: "Enter your email address", passwordPlaceholder: "Enter your password", usernameIcon: UIImage(systemName: "person"), emailIcon: UIImage(systemName: "envelope"), passwordIcon: UIImage(systemName: "lock"), loginButtonTitle: "Sign In", termsAndConditions: "By signing up, you agree to out Terms of Service and acknowledge that our Private Policy applies to you.")
        return loginData
    }()
    
    private var _loginFormType: LoginFormType = .signUp
    
    // MARK: computed properties
    var loginData: LoginData {
        get {
            return _loginData
        }
    }
    
    var formType: LoginFormType {
        get {
            return _loginFormType
        }
        set (formType) {
            _loginFormType = formType
            self.updateLoginData(for: formType)
        }
    }
    
    private mutating func updateLoginData(for loginForm: LoginFormType) {
        switch loginForm {
        
        case .signIn:
            self._loginData.loginButtonTitle = "Sign in"
            self._loginData.message = "Welcome back."
            break
            
        case .signUp:
            self._loginData.loginButtonTitle = "Create account"
            self._loginData.message = "Join us."
            self._loginData.passwordPlaceholder = "Enter your password"
            break
            
        case .signUpConfirmation:
            self._loginData.loginButtonTitle = "Confirm"
            self._loginData.message = "Confirm your account"
            self._loginData.passwordPlaceholder = "Enter your confirmation code"
            break
        }
    }
}
