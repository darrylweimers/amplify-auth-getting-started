//
//  LoginFormModel.swift
//  Login
//
//  Created by Darryl Weimers on 2021-02-06.
//

import UIKit

enum LoginFormType {
    case signIn
    case signUp
    case signUpConfirmation
}

struct LoginData {
    var title: String
    var message: String
    
    var usernamePlaceholder: String
    var emailPlaceholder: String
    var passwordPlaceholder: String
    
    var usernameIcon: UIImage?
    var emailIcon: UIImage?
    var passwordIcon: UIImage?
    
    var loginButtonTitle: String
    
    var termsAndConditions: String?
}
