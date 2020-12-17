//
//  CardContentInEndTimeView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/17.
//

import SwiftUI

struct CardContentInEndTimeView: View {
    //MARK: PROPERTIES
    var beginTime: String
    var endTime: String
    
    var body: some View {
        HStack{
            Spacer()
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
            
            Spacer()
            VStack(alignment: .center, spacing: 5, content: {
                // hour and minutes
                Text(DateHelper.instance.extractTime(timeString: endTime))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.blueColor)
                Capsule()
                    .fill(Color.MyTheme.blueColor)
                    .frame(width: 80, height: 2, alignment: .center)
            })
            .padding(.vertical, 20)
            Spacer()
        }
    }
}

struct CardContentInEndTimeView_Previews: PreviewProvider {
    static var previews: some View {
        CardContentInEndTimeView(beginTime: "2020-11-30 6:56:49 +0900", endTime: "2020-11-30 20:56:49 +0900")
    }
}
