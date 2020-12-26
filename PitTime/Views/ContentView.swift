//
//  ContentView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage(CurrentUserDefaults.userID) var currentUserID: String?
    @AppStorage(CurrentUserDefaults.displayName) var currentUserDisplayName: String?
    @AppStorage(CurrentUserDefaults.isFirstVisit) var isCurrentUserFirstVisit: Bool?
    // Feed Posts
    @State var feedPosts = PitArrayObject(shuffled: false)

    // Full Screen Cover
    @State var isShowTutorialView: Bool = false

    var body: some View {
        TabView {
            // MARK: HOME VIEW
            HomeView(pits: feedPosts, navigationBarTitle: "Home")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home".uppercased())
                }
            // MARK: UPLOAD VIEW
            NavigationView {
                UploadView()
                    // FETCH FROM PIT ARRAY OBJECT
                    .onDisappear(perform: {
                        self.feedPosts = PitArrayObject(shuffled: false)
                    })
            }
            .tabItem {
                Image(systemName: "square.and.arrow.up.fill")
                Text("Upload".uppercased())
            }

            // MARK: PROFILE VIEW
            ZStack {
                if let userID = currentUserID, let displayName = currentUserDisplayName {
                    NavigationView {
                        ProfileView(pits: PitArrayObject(userID: userID, isExports: false), profileUserID: userID, profileDisplayName: displayName, isMyProfile: true)
                    }
                } else {
                    SignUpView()
                }
            }
            .tabItem {
                Image(systemName: "person.fill")
                Text("Profile".uppercased())
            }
        }
        .accentColor(colorScheme == .light ? .black : Color.MyTheme.orangeColor)
        .onAppear(perform: {
            firstVisitSetup()
        })
        .fullScreenCover(isPresented: $isShowTutorialView, content: {
            TutorialHomeView()
        })
    }

    // MARK: FUNCTIONS
    func firstVisitSetup() {
        let visit = UserDefaults.standard.bool(forKey: CurrentUserDefaults.isFirstVisit)
        if visit {
            print("Access More Than Once")
        } else {
            print("First Access")
            self.isShowTutorialView.toggle()
            UserDefaults.standard.set(true, forKey: CurrentUserDefaults.isFirstVisit)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
