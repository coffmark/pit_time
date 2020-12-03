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
    
    @State var feedPosts = PitArrayObject(shuffled: false)
    
    var body: some View {
        TabView{
            NavigationView{
                HomeView(pits: feedPosts)
            }
            .tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
            
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
