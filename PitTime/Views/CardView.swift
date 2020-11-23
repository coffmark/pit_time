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
                    .foregroundColor(.primary)
                
                Spacer()
            }
            .padding(.all, 6)
            
            HStack{
                Text("10月11日　7:10")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            .padding(.all, 6)
            
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
            .padding(.all, 6)
            .accentColor(.primary)
        })
        
    }
}

struct CardView_Previews: PreviewProvider {
    
    static var pit: PitModel = PitModel(timeID: "", userID: "", username: "John", dateCreated: Date(), likeCount: 3, likedByUser: false)
    
    static var previews: some View {
        CardView(pit: pit)
    }
}
