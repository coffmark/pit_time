//
//  ContentView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            NavigationView{
                HomeView(pits: PitArrayObject())
            }
            .tabItem{
                Image(systemName: "house.fill")
                Text("Home")
            }
            
            NavigationView{
                UploadView()
            }
            .tabItem{
                Image(systemName: "square.and.arrow.up.fill")
                Text("Upload")
            }
            
            NavigationView{
                SignUpView()
            }
            .tabItem{
                Image(systemName: "person.fill")
                Text("Profile")
            }
            
        }
        .accentColor(Color.MyTheme.pinkColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
