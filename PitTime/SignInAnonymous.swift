//
//  SignInAnonymous.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/03.
//

import Foundation
import FirebaseAuth
import SwiftUI

class SignInAnonymous {

    static let instance = SignInAnonymous()
    var onboardingView: OnboardingView!

    func signInAnonymous(view: OnboardingView!) {
        self.onboardingView = view
        Auth.auth().signInAnonymously { authResult, error in
            if error != nil {
                // Error
                print("Error Auth Anonymously")
            } else {
                // Success
                guard let user = authResult?.user else { return }
                let isAnonymous = user.isAnonymous
                let uid = user.uid
                let fullName: String = "匿名"
                let email: String = "example.gmaile"
                let provider: String = "anonymous"

                self.onboardingView.connectToFirebaseForAnonymous(name: fullName, email: email, provider: provider, isAnonymous: isAnonymous)
            }
        }
    }
}
