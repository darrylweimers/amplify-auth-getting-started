//
//  AuthService.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-02-07.
//

import Foundation
// MARK: 1 : import amplify
import Amplify

struct AuthService {
    
    // check if user is sign in or out
    public func checkAuthStatus() {
        Amplify.Auth.fetchAuthSession { (result) in
            switch result {
            case .success(let authSession):
                if authSession.isSignedIn {
                    print("user is signed in")
                } else {
                    print("user is signed out")
                }
                break
            
            case .failure(let authError):
                print("Failed to fetch auth session! details:", authError)
                break
            }
        }
    }
    
    // sign in
    public func signIn(username: String, password: String) {
        Amplify.Auth.signIn(username: username, password: password, options: nil) { (result) in
            switch result {
            
            case .success(let authSignInResult):
                if authSignInResult.isSignedIn {
                    print("Signed in successfully!")
                }
                break
                
            case .failure(let authError):
                print("Failed to sign in! details:", authError)
                break
            }
        }
    }
    
    
    // sign up
//    public func signUp(email: String, password: String) {
//        let userAttributes = [AuthUserAttribute(.email, value: email)]
//        let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
//        Amplify.Auth.signUp(username: email, password: password, options: options) { result in
//            switch result {
//            case .success(let signUpResult):
//                if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
//                    print("Delivery details \(String(describing: deliveryDetails))")
//                } else {
//                    print("SignUp Complete")
//                }
//            case .failure(let error):
//                print("An error occurred while registering a user \(error)")
//            }
//        }
//    }
    
//    public func signUpConfirmation() {
//        Amplify.Auth.confirmSignUp(
//            for: username,
//            confirmationCode: confirmationCode
//          ) { [self] result in
//            switch result {
//            case .failure(let error):
//              logger.logError(error.localizedDescription)
//              promise(.failure(error))
//            case .success:
//              // 2
//              _ = Amplify.Auth.signIn(
//                username: username,
//                password: password
//              ) { result in
//                switch result {
//                case .failure(let error):
//                  logger.logError(error.localizedDescription)
//                  promise(.failure(error))
//                case .success:
//                  // 3
//                  checkAuthSession()
//                }
//              }
//            }
//          }
//    }
    
    
}
