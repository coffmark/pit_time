//
//  SignUpView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import SwiftUI

struct SignUpView: View {

    @State var showOnboarding: Bool = false

    var body: some View {
        VStack(alignment: .center/*@END_MENU_TOKEN@*/, spacing: 20, content: {
            Spacer()

            Text("まだサインインしておりません！🥺")
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(.white)

            Button(action: {
                self.showOnboarding.toggle()
            }, label: {
                Text("Sign in / Sign up".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(Color.MyTheme.orangeColor)
                    .cornerRadius(12)
                    .shadow(radius: 12)

            })

            Button(action: {
                self.showOnboarding.toggle()
            }, label: {
                Text("Anonymous".uppercased())
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 70)
                    .background(Color.MyTheme.orangeColor)
                    .cornerRadius(12)
                    .shadow(radius: 12)
            })
            Spacer()
        })
        .padding(.all, 40)
        .background(Color.MyTheme.blueColor)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnboarding, content: {
            OnboardingView()
        })
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
