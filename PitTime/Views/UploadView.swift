//
//  UploadView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct UploadView: View {
    var sessionWrite = NFCSessionWrite()
    @AppStorage(CurrentUserDefaults.userID) var currentUserID: String?

    // Alert
    @State var showWarningNotLoggedIn: Bool = false
    var body: some View {
        ZStack {
            Color.MyTheme.blueColor
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .center, spacing: 40, content: {
                Button(action: {
                    // MARK: FIX ---- POST ID ----
                    if currentUserID != nil {
                        self.sessionWrite.beginScanning(isShareOthers: false, isEndTime: false, postID: "")
                    } else {
                        self.showWarningNotLoggedIn.toggle()
                    }
                }, label: {
                    Text("一人で頑張る！")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        .background(Color.MyTheme.orangeColor)
                        .cornerRadius(20)
                        .shadow(radius: 20)
                })
                Button(action: {
                    // MARK: FIX ---- POST ID ----
                    if currentUserID != nil {
                        self.sessionWrite.beginScanning(isShareOthers: true, isEndTime: false, postID: "")
                    } else {
                        self.showWarningNotLoggedIn.toggle()
                    }
                }, label: {
                    Text("一緒に1日をスタートしましよう！")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        .background(Color.MyTheme.orangeColor)
                        .cornerRadius(20)
                        .shadow(radius: 20)
                })
            })
        }
        .padding(.all, 40)
        .background(Color.MyTheme.blueColor)
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showWarningNotLoggedIn, content: {
            Alert(title: Text("ログインしておりません。"), message: Text("ログインしていただく必要があります。🥺"), dismissButton: .default(Text("OK")))
        })
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
