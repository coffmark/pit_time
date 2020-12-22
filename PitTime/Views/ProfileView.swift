//
//  ProfileView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct ProfileView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var pits: PitArrayObject
    var profileUserID: String
    @State var profileDisplayName: String
    var isMyProfile: Bool

    @State var showSettings: Bool = false
    @State var showChangeImage: Bool = false
    @State var profileImage = UIImage(named: "logo.loading")!
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            ScrollView(.vertical, showsIndicators: false, content: {
                ProfileHeaderView(profileImage: $profileImage, profileDisplayName: $profileDisplayName)
                Divider()
                if pits.pitArray.isEmpty {
                    // Non Posts
                    ProfileNonPostsView()
                } else {
                    HomeView(pits: pits)
                }
            })
            .offset(x: 0, y: 20)

        }
        .navigationBarTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(
            trailing:
                Button(action: {
                    showSettings.toggle()
                }, label: {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 20, height: 20)
                })
                .sheet(isPresented: $showSettings, content: {
                    SettingsView()
                        .preferredColorScheme(colorScheme)
                })
                .accentColor(colorScheme == .light ? Color.MyTheme.blueColor : Color.MyTheme.orangeColor)
                .opacity(isMyProfile ? 1.0 : 0.0)
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(pits: PitArrayObject(shuffled: false), profileUserID: "Ryosuke", profileDisplayName: "", isMyProfile: true)
    }
}
