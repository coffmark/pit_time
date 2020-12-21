//
//  CardDefaultContentView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/17.
//

import SwiftUI

struct CardDefaultContentView: View {
    @AppStorage(CurrentUserDefaults.userID) var curreentUserID: String?
    var beginTime: String
    var postID: String
    var userID: String
    var sessionWrite = NFCSessionWrite()

    // Alert
    @State var showErrorAccoutMismatch: Bool = false

    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 50, content: {
                VStack(alignment: .center, spacing: 5, content: {
                    Text("Start".uppercased())
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.blueColor)
                    // Display Only BeginTime
                    Text(DateHelper.instance.extractTime(timeString: beginTime))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.blueColor)
                    Capsule()
                        .fill(Color.MyTheme.blueColor)
                        .frame(width: 80, height: 2, alignment: .center)
                })

                // Add End Time
                Button(action: {
                    guard let displayUserID = curreentUserID else {
                        print("displayUserID is nil")
                        self.showErrorAccoutMismatch.toggle()
                        return
                    }
                    if displayUserID == userID {
                        self.sessionWrite.beginScanning(isShareOthers: true, isEndTime: true, postID: postID)
                    } else {
                        self.showErrorAccoutMismatch.toggle()
                    }
                }, label: {
                    Text("ピッとタイム")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.MyTheme.blueColor)
                        .cornerRadius(60)
                        .shadow(color: Color.MyTheme.blueColor, radius: 8)
                })
            })
            .padding(.vertical, 20)
            .alert(isPresented: $showErrorAccoutMismatch) { () -> Alert in
                Alert(title: Text("アカウントが一致しておりません。"), message: Text("投稿したアイテムしか変更を加えることができません。"), dismissButton: .default(Text("OK")))
            }
        }
    }
}

struct CardDefaultContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardDefaultContentView(beginTime: "2020-11-30 7:56:49 +0900", postID: "", userID: "")
            .previewLayout(.sizeThatFits)
    }
}
