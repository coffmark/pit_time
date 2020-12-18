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
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30, alignment: .center)
                    .cornerRadius(15)
                Text(pit.username)
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundColor(Color.MyTheme.blueColor)
                Spacer(minLength: 0)

                // year and month and day
                Text(DateHelper.instance.extractDate(dateString: pit.pitTime))
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.MyTheme.blueColor)
            }
            .padding(.all, 5)

            VStack(alignment: .center, spacing: 5, content: {
                // hour and minutes
                Text(DateHelper.instance.extractTime(timeString: pit.pitTime))
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.blueColor)
                Capsule()
                    .fill(Color.MyTheme.blueColor)
                    .frame(width: 80, height: 2, alignment: .center)
            })
            .padding(.vertical, 20)
        })
        .background(Color.MyTheme.orangeColor)
        .border(Color.MyTheme.blueColor, width: 2)
        .padding(.horizontal, 10)
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

    static var pit = PitModel(postID: "", userID: "", username: "Ryosuke", dateCreated: Date(), pitTime: "2020-11-30 22:56:49 +0000")

    static var previews: some View {
        CardView(pit: pit)
        //            .previewLayout(.sizeThatFits)
    }
}
