//
//  SettingsLabelView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/30.
//

import SwiftUI

struct SettingsLabelView: View {
    var title: String
    var imageName: String
    
    var body: some View {
        HStack{
            Text(title)
            Spacer()
            Image(systemName: imageName)
        }
        .padding()
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(title: "Pit Time", imageName: "dot.radiowaves.left.and.right")
    }
}
