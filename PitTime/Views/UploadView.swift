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
        ZStack{
            Color.MyTheme.blueColor
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center, spacing: 40, content: {
                Button(action: {
                    self.sessionWrite.beginScanning(isShareOthers: false)
                }, label: {
                    Text("一人で頑張る！")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.beigeColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: 90)
                        .background(Color.MyTheme.orangeColor)
                        .cornerRadius(20)
                        .shadow(radius: 20)
                })
                Button(action: {
                    self.sessionWrite.beginScanning(isShareOthers: true)
                }, label: {
                    Text("一緒に1日をスタートしましよう！")
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.beigeColor)
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
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
