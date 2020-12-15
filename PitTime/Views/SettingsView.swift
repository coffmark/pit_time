//
//  SettingsView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/26.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                VStack(alignment: .center, spacing: 20, content: {

                    // MARK: SECTION 1: PIT-TIME
                    GroupBox(label:
                                SettingsLabelView(title: "Pit Time", imageName: "dot.radiowaves.left.and.right"),
                             content: {
                                HStack {
                                    Image("noimage")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 120, height: 120, alignment: .center)
                                        .cornerRadius(10)
                                    VStack {
                                        Text("ピッとたいむは、あなたのための時間管理アプリ")
                                            .font(.footnote)
                                        Spacer()
                                        Text("必要なもの: NFCタグ")
                                            .font(.body)
                                            .foregroundColor(Color.MyTheme.blueColor)
                                    }
                                }
                             }
                    )

                    // MARK: SECTION 2: PROFILE
                    GroupBox(
                        label:
                            SettingsLabelView(title: "PROFILE", imageName: "person"),
                        content: {
                            Button(action: {
                                signOut()
                            }, label: {
                                SettingsRowView(text: "Sign Out")
                            })
                        })

                    GroupBox(label: SettingsLabelView(title: "Contact", imageName: "envelope.open.fill"), content: {
                        Text("info.ryosuke.kamimura@gmail.com")
                    })
                })
            })
        }
    }

    // PRIVATE FUNCTION
    func signOut() {
        AuthService.instance.logOutUser { success in
            if success {
                print("Successfully logged out")
                self.presentationMode.wrappedValue.dismiss()
            } else {
                print("Error logging out")
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
