//
//  TutorialHomeView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/14.
//

import SwiftUI

struct TutorialHomeView: View {
    @Environment(\.presentationMode) var presentaionMode
    @AppStorage(CurrentUserDefaults.isFirstVisit) var isCurrentUserFirstVisit: Bool?
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    presentaionMode.wrappedValue.dismiss()
                }, label: {
                    Text("Skip")
                        .foregroundColor(Color.MyTheme.orangeColor)
                        
                    
                })
            }
            Spacer()
            
            TutorialContentView()
            
            Spacer()
        }
        .padding(.all, 40)
        .background(Color.MyTheme.orangeColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct TutorialHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialHomeView()
    }
}
