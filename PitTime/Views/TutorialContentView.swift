//
//  TutorialContentView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/14.
//

import SwiftUI

struct TutorialContentView: View {
    
    @State var selection: Int = 0
    let maxCount: Int = 3
    var body: some View {
        TabView(selection: $selection,
                content:  {
                    Text("Tab Content 1").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 1")/*@END_MENU_TOKEN@*/ }.tag(1)
                    Text("Tab Content 2").tabItem { /*@START_MENU_TOKEN@*/Text("Tab Label 2")/*@END_MENU_TOKEN@*/ }.tag(2)
                })
            .tabViewStyle(PageTabViewStyle())
    }
}

struct TutorialContentView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialContentView()
    }
}
