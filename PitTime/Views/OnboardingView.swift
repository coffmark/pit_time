//
//  OnboardingView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/25.
//

import SwiftUI
import FirebaseAuth

struct OnboardingView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var displayName: String = ""
    @State var email: String = ""
    @State var providerID: String = ""
    @State var provider: String = ""
    
    @State var showOnboardingPart2: Bool = false
    @State var showError: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            HStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .font(.title)
                        .accentColor(.black)
                        .padding(.vertical, 40)
                        .padding(.leading, 20)
                })
                Spacer()
            }
            Spacer()
            Text("Welcome to ピッとたいむ!".uppercased())
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .accentColor(Color.MyTheme.blueColor)
            
            Text("「ピッとたいむ」は時間管理を後押しするアプリです。")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(.black)
                .padding()
                .accentColor(Color.MyTheme.blueColor)
            
            //MARK: SIGN IN WITH APPLE
            Button(action: {
                SignInWithApple.instance.startSignInWithAppleFlow(view: self)
            }, label: {
                Text("Sign In Apple")
            })
            
            //MARK: SIGN IN WITH GOOGLE
            
            
            Spacer()
        })
        .background(Color.MyTheme.beigeColor)
        .edgesIgnoringSafeArea(.all)
    }
    
    //MARK: FUNCTIONS
    func connectToFirebase(name: String, email: String, provider: String, credentical: AuthCredential) {
        AuthService.instance.logInUserToFirebase(credential: credentical) { (returnedProviderID, isError, isNewUser, returnedUserID) in
            if let newUser = isNewUser {
                if newUser{
                    // NEW USER
                    if let providerID = returnedProviderID, !isError {
                        // SUCCESS
                        // New user, continue to the onboarding part 2
                        self.displayName = name
                        self.email = email
                        self.providerID = providerID
                        self.provider = provider
                        self.showOnboardingPart2.toggle()
                    }else{
                        //ERROR
                        print("Error getting provider ID from log in user to Firebase")
                        self.showError.toggle()
                    }
                }else{
                    // EXISTING USER
                }
                
            }
        }
        
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
