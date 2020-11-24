//
//  HomeView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var pits: PitArrayObject
    
    
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
            LazyVStack{
                ForEach(pits.pitArray, id: \.self, content: { pit in
                    CardView(pit: pit)
                        .padding(.vertical, 10)
                })
            }
        })
        .navigationBarTitle("Home")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(pits: PitArrayObject())
    }
}
