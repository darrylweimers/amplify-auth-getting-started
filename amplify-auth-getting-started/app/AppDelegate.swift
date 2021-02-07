//
//  AppDelegate.swift
//  amplify-auth-getting-started
//
//  Created by Darryl Weimers on 2021-01-23.
//

import UIKit
// MARK: 1: import amplify plugins
import Amplify
import AmplifyPlugins

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: 2: configure amplify resources
    private func configureAmplifyResources() {
        do {
            
            try Amplify.add(plugin: AWSCognitoAuthPlugin())
            
            try Amplify.configure()
            
            print("Successfully configured amplify resource")
        } catch {
            print("Fail to configure amplify resource")
        }
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configureAmplifyResources()
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

