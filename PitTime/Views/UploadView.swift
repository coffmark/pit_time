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
                self.sessionWrite.beginScanning()
                postCloudStore()
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
            Button(action: {
//                RealmDataService.instance.fetchRealmDB()
            }, label: {
                Text("Realm Fetch Data")
                    .font(.title3)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 90)
                    .background(Color.MyTheme.orangeColor)
                    .cornerRadius(20)
            })
            .accentColor(.white)
            Spacer()
        })
        .padding(.all, 30)
        .background(Color.MyTheme.blueColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    //MARK: FUNCTIONS
    func postCloudStore() {
        print("POST CLOUD STORE")
        guard let userID = currentUserID, let displayName = currentUserDisplayName else{
            print("Error getting userID or displayName")
            return
        }
        let pitTime = "2020-11-30 15:02:00 +0000"
        DataService.instance.uploadPost(pitTime: pitTime, displayName: displayName, userID: userID) { (success) in
            if success{
                print("Success Post!")
            }else{
                print("Error uploading post!")
            }
        }
    }
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
