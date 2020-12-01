//
//  CardView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct CardView: View {
    
    @State var pit: PitModel
    
    var image: UIImage = UIImage(named: "John")!
    
    var body: some View {
        ZStack{
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
                        .foregroundColor(.white)
                    
                    Spacer()
                }
//                .padding(.all, 6)
                
                HStack{
                    Text(pit.pitTime)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                }
//                .padding(.all, 6)
                
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "heart.fill")
                            .font(.body)
                    })
                    
                    Button(action: {
                        
                    }, label: {
                        Image(systemName: "paperplane")
                            .font(.body)
                    })
                })
//                .padding(.all, 6)
                .accentColor(.white)
            })
            .background(Color.MyTheme.orangeColor)
        }
        .border(Color.black,width: 2)
        .padding(.horizontal, 5)
    }
}

struct CardView_Previews: PreviewProvider {
    
    static var pit: PitModel = PitModel(postID: "", userID: "", username: "Ryosuke", dateCreated: Date(), pitTime: "2020-11-30 22:56:49 +0000")
    
    static var previews: some View {
        CardView(pit: pit)
    }
}
