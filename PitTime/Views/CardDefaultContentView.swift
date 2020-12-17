//
//  CardDefaultContentView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/17.
//

import SwiftUI

struct CardDefaultContentView: View {
    
    var beginTime: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 5, content: {
            // hour and minutes
            Text(DateHelper.instance.extractTime(timeString: beginTime))
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.blueColor)
            Capsule()
                .fill(Color.MyTheme.blueColor)
                .frame(width: 80, height: 2, alignment: .center)
        })
        .padding(.vertical, 20)
    }
}

struct CardDefaultContentView_Previews: PreviewProvider {
    static var previews: some View {
        CardDefaultContentView(beginTime: "2020-11-30 7:56:49 +0900")
    }
}
