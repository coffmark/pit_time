//
//  SettingsRowView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/30.
//

import SwiftUI

struct SettingsRowView: View {
    var text: String

    var body: some View {
        Text(text)
            .foregroundColor(.primary)
        Spacer()
        Image(systemName: "chevron.right")
            .font(.headline)
            .foregroundColor(.primary)
    }
}

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsRowView(text: "Sign Out")
    }
}
