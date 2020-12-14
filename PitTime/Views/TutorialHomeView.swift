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
    @State var selection: Int = 0
    
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 0, content: {
                Spacer()
                // Slide Tutorial Show
                TabView(selection: $selection,
                        content:  {
                            Image("tutorial1")
                                .resizable()
                                .scaledToFit()
                                .tag(1)
                            Image("tutorial2")
                                .resizable()
                                .scaledToFit()
                                .tag(2)
                            Image("tutorial3")
                                .resizable()
                                .scaledToFit()
                                .tag(3)
                            Button(action: {
                                print("BUTTON CLICKED")
                                presentaionMode.wrappedValue.dismiss()
                            }, label: {
                                Text("Let's Start".uppercased())
                                    .font(.title3)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.all, 30)
                                    .background(Color.MyTheme.blueColor)
                                    .cornerRadius(10)
                                    .shadow(radius: 20)
                            })
                            .tag(4)
                        })
                    .tabViewStyle(PageTabViewStyle())
                    .frame(height: 500)
                Spacer()
            })
            .background(Color.MyTheme.orangeColor)
            .edgesIgnoringSafeArea(.all)
            .navigationBarItems(trailing: Button(action: {
                presentaionMode.wrappedValue.dismiss()
            }, label: {
                Text("Skip")
                    .font(.footnote)
                    .fontWeight(.bold)
                    .foregroundColor(Color.MyTheme.blueColor)
            }))
        }
    }
}

struct TutorialHomeView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialHomeView()
    }
}
