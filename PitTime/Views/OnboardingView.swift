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
    @State var isUnderImplementation: Bool = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Spacer()
            Text("Welcome to PIT Time!".uppercased())
                .font(.largeTitle)
                .fontWeight(.bold)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .foregroundColor(Color.MyTheme.blueColor)
            
            Text("「ピッとタイム」は時間管理をお手伝いするアプリです。")
                .font(.headline)
                .fontWeight(.medium)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.MyTheme.beigeColor)
                .padding()
            
            //MARK: SIGN IN WITH APPLE
            Button(action: {
                SignInWithApple.instance.startSignInWithAppleFlow(view: self)
            }, label: {
                SignInWithAppleButtonCustom()
                    .frame(maxWidth: .infinity)
                    .frame(height: 60)
                    .padding(.horizontal, 20)
                    .shadow(radius: 20)
            })
            
            //MARK: SIGN IN WITH GOOGLE
            Button(action: {
                SignInWithGoogle.instance.startSignInWithGoogleFlow(view: self)
            }, label: {
                HStack{
                    Image(systemName: "g.square")
                    Text("Sign in with Google")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Color(.sRGB, red: 222/255, green: 82/255, blue: 70/255, opacity: 1.0))
                .cornerRadius(9)
                .font(.system(size: 25, weight: .medium, design: .default))
                .padding(.horizontal, 20)
                .shadow(radius: 20)
            })
            .accentColor(.white)
            
            //MARK: SIGN IN ANONYMOUS
            Button(action: {
                isUnderImplementation.toggle()
            }, label: {
                HStack{
                    Image(systemName: "person.crop.circle.badge.exclam")
                    Text("Sign in Anonymous")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Color(.darkGray))
                .cornerRadius(9)
                .font(.system(size: 25, weight: .medium, design: .default))
                .padding(.horizontal, 20)
                .shadow(radius: 20)
            })
            .accentColor(.white)
            
            //MARK: RETURN TO THE PREVIOUS PAGE
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }, label: {
                HStack{
                    Image(systemName: "arrowshape.turn.up.left.circle.fill")
                    Text("BACK")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Color(.lightGray))
                .foregroundColor(.white)
                .cornerRadius(9)
                .font(.system(size: 25, weight: .medium, design: .default))
                .padding(.horizontal, 20)
                .shadow(radius: 20)
            })
            .accentColor(Color(.lightGray))
            
            Spacer()
        })
        .background(Color.MyTheme.orangeColor)
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showOnboardingPart2, onDismiss:  {
            self.presentationMode.wrappedValue.dismiss()
        }, content: {
            OnboardingViewPart2(displayName: $displayName, email: $email, providerID: $providerID, provider: $provider)
        })
        .alert(isPresented: $showError) { () -> Alert in
            Alert(title: Text("Error signingg in 🙁"))
        }
        .alert(isPresented: $isUnderImplementation, content: {
            Alert(title: Text("Sorry Please Wait😥"))
        })
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
                        print("This is email -> \(email)")
                        self.showOnboardingPart2.toggle()
                    }else{
                        //ERROR
                        print("Error getting provider ID from log in user to Firebase")
                        self.showError.toggle()
                    }
                }else{
                    // EXISTING USER
                    if let userID = returnedUserID {
                        // SUCCESS, LOG IN TO APP
                        AuthService.instance.logInUserToApp(userID: userID) { (success) in
                            if success{
                                print("Successfull log in existing user")
                                self.presentationMode.wrappedValue.dismiss()
                            }else{
                                print("Error log in existing user into our app")
                                self.showError.toggle()
                            }
                        }
                    }else{
                        // ERROR
                        print("Error getting User ID from existing user to Firebase")
                        self.showError.toggle()
                    }
                }
            }else{
                // ERROR
                print("Error getting into from  log in user to Firebase")
                self.showError.toggle()
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
