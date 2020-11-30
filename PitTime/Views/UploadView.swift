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
    @AppStorage(CurrentUserDefaults.displayName) var currentUserDisplayName: String?
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
            Spacer()
            Button(action: {
                self.sessionWrite.beginScanning(isShareOthers: true)
            }, label: {
                Text("今日も1日をスタートしましよう！")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .frame(height: 90)
                    .background(Color.MyTheme.orangeColor)
                    .cornerRadius(20)
            })
            Spacer()
        })
        .padding(.all, 30)
        .background(Color.MyTheme.blueColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
