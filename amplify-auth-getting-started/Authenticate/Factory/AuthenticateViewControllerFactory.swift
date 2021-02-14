//
//  LoginFactory.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-10.
//

import UIKit

class AuthenticateViewControllerFactory {
    
    private let viewModelFactory: AuthenticateViewModelFactory
    
    init(viewModelFactory: AuthenticateViewModelFactory) {
        self.viewModelFactory = viewModelFactory
    }
    
    func makeSignInViewController() -> SignInViewController {
        let viewModel = viewModelFactory.makeSignInViewModel()
        return SignInViewController(loginData: viewModel.data, loginForm: viewModel.type)
    }
    
    func makeSignUpViewController() -> SignUpViewController {
        let viewModel = viewModelFactory.makeSignUpViewModel()
        return SignUpViewController(loginData: viewModel.data, loginForm: viewModel.type)
    }
    
    func makeSignUpConfirmationViewController() -> SignUpConfirmationViewController {
        let viewModel = viewModelFactory.makeSignUpConfirmationViewModel()
        return SignUpConfirmationViewController(loginData: viewModel.data, loginForm: viewModel.type)
    }
}
