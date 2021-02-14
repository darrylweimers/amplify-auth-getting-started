//
//  AuthenticateViewModelFactory.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-13.
//

import UIKit

class AuthenticateViewModelFactory {
    
    func makeSignInViewModel() -> SignInViewModel {
        return SignInViewModel()
    }
    
    func makeSignUpViewModel() -> SignUpViewModel {
        return SignUpViewModel()
    }
    
    func makeSignUpConfirmationViewModel() -> SignUpConfirmationViewModel {
        return SignUpConfirmationViewModel()
    }
}
