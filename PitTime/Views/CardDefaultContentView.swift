//
//  CardDefaultContentView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/17.
//

import SwiftUI

struct CardDefaultContentView: View {
    var beginTime: String
    var sessionWrite = NFCSessionWrite()
    
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 50, content: {
                VStack(alignment: .center, spacing: 5, content: {
                    // Display Only BeginTime
                    Text(DateHelper.instance.extractTime(timeString: beginTime))
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color.MyTheme.blueColor)
                    Capsule()
                        .fill(Color.MyTheme.blueColor)
                        .frame(width: 80, height: 2, alignment: .center)
                })
                
                Button(action: {
                    self.sessionWrite.beginScanning(isShareOthers: true, isEndTime: false)
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
        }
    }
}

struct CardDefaultContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardDefaultContentView(beginTime: "2020-11-30 7:56:49 +0900")
            .previewLayout(.sizeThatFits)
    }
}
