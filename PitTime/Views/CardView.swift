//
//  CardView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct CardView: View {

    @State var pit: PitModel
    @State var image = UIImage(named: "noimage")!

    var body: some View {
        VStack(alignment: .center, spacing: 0, content: {
            HStack {
                // Display Profile Image
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .cornerRadius(15)
                // Display Profile UserName
                Text(pit.username)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.MyTheme.blueColor)
                Spacer(minLength: 0)
                // Display Year/Month/Day
                Text(DateHelper.instance.extractDate(dateString: pit.pitBeginTime))
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.MyTheme.blueColor)
            }
            .padding(.all, 5)
            // Display Time
            if let endTime = pit.pitEndTime {
                // In BeginTime And EndTime
                CardContentInEndTimeView(beginTime: pit.pitBeginTime, endTime: endTime, postID: pit.postID)
                
            }else{
                // Only BeginTime
                CardDefaultContentView(beginTime: pit.pitBeginTime)
            }
        })
        .background(Color.MyTheme.orangeColor)
        .border(Color.MyTheme.orangeColor, width: 2)
        .padding(.horizontal, 15)
        .shadow(color: Color.MyTheme.orangeColor, radius: 5)
        .onAppear(perform: {
            fetchProfileImage(userID: pit.userID)
        })
    }

    // MARK: FUNCTIONS
    func fetchProfileImage(userID: String) {
        ImageManager.instance.downloadProfileImage(userID: userID) { (retuendImage) in
            if let uiImage = retuendImage{
                self.image = uiImage
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var pit = PitModel(postID: "", userID: "", username: "Ryosuke", dateCreated: Date(), pitBeginTime: "2020-11-30 22:56:49 +0900")
    static var previews: some View {
        CardView(pit: pit)
    }
}
