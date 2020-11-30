//
//  SettingsView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/26.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView{
            ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false, content: {
                //MARK: SECTION 1: PIT-TIME
                GroupBox(label: SettingsLabelView(), content: {
                    HStack {
                        Image("noimage")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120, alignment: .center)
                            .cornerRadius(10)
                        VStack{
                            Text("ピッとたいむは、あなたのための時間管理アプリ")
                                .font(.footnote)
                            Spacer()
                            Text("必要なもの: NFCタグ")
                                .font(.body)
                                .foregroundColor(Color.MyTheme.blueColor)
                        }
                    }
                })
            })
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
