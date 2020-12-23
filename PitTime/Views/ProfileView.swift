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

    // Show File Exporter
    @State var showFileExporter: Bool = false

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
            leading:
                Button(action: {
                    self.showFileExporter.toggle()
                }, label: {
                    Image(systemName: "square.and.arrow.up")
                        .resizable()
                        .frame(width: 20, height: 20)
                })
                .sheet(isPresented: $showFileExporter, content: {
                    FileExportView()
                }), trailing:
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
    func downloadCsvFile() {
        do {
            let fileManager = FileManager.default
            let docs = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let path = docs.appendingPathComponent("myFile.txt")
            let data = "Hello.world!".data(using: .utf8)!

            fileManager.createFile(atPath: path.path, contents: data, attributes: nil)
            print("File Manager Done!")
        } catch {
            print(error)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(pits: PitArrayObject(shuffled: false), profileUserID: "Ryosuke", profileDisplayName: "", isMyProfile: true)
    }
}
