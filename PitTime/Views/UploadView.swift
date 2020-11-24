//
//  UploadView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct UploadView: View {
    
    var sessionWrite = NFCSessionWrite()
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
            Spacer()
            Button(action: {
                self.sessionWrite.beginScanning()
            }, label: {
                Text("今日も1日をスタートしましよう！")
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
}

struct UploadView_Previews: PreviewProvider {
    static var previews: some View {
        UploadView()
    }
}
