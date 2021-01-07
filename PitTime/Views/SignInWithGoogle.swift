//
//  SignInWithGoogle.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/25.
//

import SwiftUI
import Foundation
import GoogleSignIn
import FirebaseAuth

class SignInWithGoogle: NSObject, GIDSignInDelegate {
    static let instance = SignInWithGoogle()

    var onboardingView: OnboardingView!

    func startSignInWithGoogleFlow(view: OnboardingView!) {
        self.onboardingView = view

        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = UIApplication.shared.windows.first?.rootViewController
        GIDSignIn.sharedInstance()?.presentingViewController.modalPresentationStyle = .fullScreen
        GIDSignIn.sharedInstance()?.signIn()
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            print("ERROR SIGNING IN TO GOOGLE")
            self.onboardingView.showError.toggle()
            return

        }
        let fullName: String = user.profile.name
        let email: String = user.profile.email
        let idToken: String = user.authentication.idToken
        let accessToken: String = user.authentication.accessToken

        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)

        self.onboardingView.connectToFirebase(name: fullName, email: email, provider: "google", credentical: credential)
    }

    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
        print("USER DISSCONNECETED FROM GOOGLE")
        self.onboardingView.showError.toggle()
    }

}
