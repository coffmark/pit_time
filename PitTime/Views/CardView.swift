//
//  CardView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct CardView: View {
    
    @State var pit: PitModel
    var image: UIImage = UIImage(named: "noimage")!
    @State var isHeart: Bool = false
    
    
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 0, content: {
            HStack{
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
                Text("\(year(content: pit.pitTime))-\(month(content: pit.pitTime))-\(day(content: pit.pitTime))")
                    .font(.headline)
                    .fontWeight(.thin)
                    .foregroundColor(Color.MyTheme.blueColor)
            }
            .padding(.all, 5)
            
   
                
            
            VStack(alignment: .center, spacing: 5, content: {
                // hour and minutes
                Text("\(hour(content: pit.pitTime)):\(minutes(content: pit.pitTime))")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.blueColor)
                Capsule()
                    .fill(Color.MyTheme.blueColor)
                    .frame(width: 80, height: 2, alignment: .center)
            })

         
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                Spacer()
                
                Button(action: {
                    self.isHeart.toggle()
                }, label: {
                    Image(systemName: isHeart ? "heart.fill" : "heart")
                        .font(.body)
                        .foregroundColor(Color.MyTheme.blueColor)
                })
                
                Button(action: {
                    // go to share view ..🦋
                }, label: {
                    Image(systemName: "paperplane")
                        .font(.body)
                        .foregroundColor(Color.MyTheme.blueColor)
                })
            })
            .padding(.all, 5)
            .accentColor(.white)
        })
        .background(Color.MyTheme.orangeColor)
        .border(Color.MyTheme.blueColor, width: 2)
        .padding(.horizontal, 5)
    }
    
    //MARK: FUNCTIONS®
    func year(content: String) -> String {
        let year: String =  DateUtils.stringFromOnlyYear(date: DateUtils.dateFromString(string: content, format: "yyyy年MM月dd日 HH時mm分ss秒 Z"))
        return year
    }
    
    func month(content: String) -> String {
        let month: String =  DateUtils.stringFromDateOnlyMonth(date: DateUtils.dateFromString(string: content, format: "yyyy年MM月dd日 HH時mm分ss秒 Z"))
        return month
    }
    
    func day(content: String) -> String {
        let day: String =  DateUtils.stringFromDateOnlyDay(date: DateUtils.dateFromString(string: content, format: "yyyy年MM月dd日 HH時mm分ss秒 Z"))
        return day
    }
    
    func hour(content: String) -> String{
        let hour: String = DateUtils.stringFromDateOnlyHour(date: DateUtils.dateFromString(string: content, format: "yyyy年MM月dd日 HH時mm分ss秒 Z"))
        return hour
    }
    
    func minutes(content: String) -> String{
        let minutes: String =  DateUtils.stringFromDateOnlyMinutes(date: DateUtils.dateFromString(string: content, format: "yyyy年MM月dd日 HH時mm分ss秒 Z"))
        return minutes
    }
    
    func intHour(content: String) -> Int{
        let intHour: Int = DateUtils.HourFromTotalMunutes(date: DateUtils.dateFromString(string: content, format: "yyyy年MM月dd日 HH時mm分ss秒 Z"))
        return intHour
    }
}


struct CardView_Previews: PreviewProvider {
    
    static var pit: PitModel = PitModel(postID: "", userID: "", username: "Ryosuke", dateCreated: Date(), pitTime: "2020-11-30 22:56:49 +0000")
    
    static var previews: some View {
        CardView(pit: pit)
            .previewLayout(.sizeThatFits)
    }
}
