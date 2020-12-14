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
    
    @State var feedPosts = PitArrayObject(shuffled: false)
    // Full Screen Cover
    @State var isShowTutorialView: Bool = false
    
    var body: some View {
        TabView{
            //MARK: HOME VIEW
            NavigationView{
                HomeView(pits: feedPosts)
            }
            .tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            //MARK: UPLOAD VIEW
            NavigationView{
                UploadView()
                    .onDisappear(perform: {
                        self.feedPosts = PitArrayObject(shuffled: false)
                    })
            }
            .tabItem{
                Image(systemName: "square.and.arrow.up.fill")
                Text("Upload")
            }
            
            //MARK: PROFILE VIEW
            ZStack{
                if let userID = currentUserID, let displayName = currentUserDisplayName{
                    NavigationView{
                        ProfileView(profileUserID: userID, profileDisplayName: displayName, isMyProfile: true)
                    }
                }else{
                    SignUpView()
                }
            }
            .tabItem{
                Image(systemName: "person.fill")
                Text("Profile")
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
    
    //MARK: FUNCTIONS
    func firstVisitSetup(){
        let visit = UserDefaults.standard.bool(forKey: CurrentUserDefaults.isFirstVisit)
        if visit{
            print("2回目以降")
            
            //MARK:  This is temporary false
            UserDefaults.standard.set(false, forKey: CurrentUserDefaults.isFirstVisit)
        }else{
            print("初回アクセス")
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
