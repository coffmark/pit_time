//
//  SettingsLabelView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/30.
//

import SwiftUI

struct SettingsLabelView: View {
    var body: some View {
        HStack{
            Text("Pit Time")
            Spacer()
            Image(systemName: "dot.radiowaves.left.and.right")
        }
        .padding()
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView()
    }
}
