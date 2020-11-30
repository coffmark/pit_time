//
//  ProfileHeaderView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @State var headerImage: UIImage = UIImage(named: "noimage")!
    var displayName: String
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Image(uiImage: headerImage)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 120)
                .background(Color(.systemPink))
                .cornerRadius(40)
            
            Text(displayName.uppercased())
                .font(.title)
                .fontWeight(.bold)
        })
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(displayName: "Ryosuke Kamimura")
            .previewLayout(.sizeThatFits)
    }
}
