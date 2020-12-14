//
//  PitTimeApp.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI
import FirebaseCore
import GoogleSignIn


@main
struct PitTimeApp: App {
    init() {
        FirebaseApp.configure()
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { (url) in
                    GIDSignIn.sharedInstance().handle(url) // For Google Sign In
                }
        }
    }
}
