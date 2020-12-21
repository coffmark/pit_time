//
//  ProfileNonPostsView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/21.
//

import SwiftUI

struct ProfileNonPostsView: View {
    var body: some View {
        Text("まだ投稿されておりません🥺")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(Color.MyTheme.orangeColor)
            .lineLimit(2)
            .padding(.all, 30)
            .background(Color.MyTheme.blueColor)
            .cornerRadius(20)
            .shadow(radius: 10)
    }
}

struct ProfileNonPostsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileNonPostsView()
    }
}
