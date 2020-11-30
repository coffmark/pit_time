//
//  ProfileView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var profileUserID: String
    @State var profileDisplayName: String
    var isMyProfile: Bool
    
    @State var showSettings: Bool = false
   
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
            ProfileHeaderView(displayName: profileDisplayName)
            Divider()
            
        })
        .navigationBarTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing:
                            Button(action: {
                                showSettings.toggle()
                            }, label: {
                                Image(systemName: "line.horizontal.3")
                            })
                            .accentColor(colorScheme == .light ? Color.MyTheme.beigeColor : Color.MyTheme.orangeColor)
                                .opacity(isMyProfile ? 1.0 : 0.0)
                         
                                
        )

        .sheet(isPresented: $showSettings, content: {
            SettingsView()
                .preferredColorScheme(colorScheme)
        })
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(profileUserID: "Ryosuke", profileDisplayName: "", isMyProfile: true)
    }
}
