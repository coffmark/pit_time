//
//  OnboardingViewPart2.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/25.
//

import SwiftUI

struct OnboardingViewPart2: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var displayName: String
    @Binding var email: String
    @Binding var providerID: String
    @Binding var provider: String
    
    @State var imageSelected: UIImage = UIImage(named: "noimage")!
    @State var showError: Bool = false
    
    let initialAnonymousName: String = "匿名"
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Text("What's your name?")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.MyTheme.blueColor)
            TextField("Add your name here...", text: $displayName)
                .padding()
                .frame(height: 40)
                .frame(maxWidth: .infinity)
                .background(Color.MyTheme.beigeColor)
                .foregroundColor(.black)
                .cornerRadius(12)
                .font(.headline)
                .autocapitalization(.sentences)
                .padding(.horizontal)
            
            Button(action: {
                createProfile()
            }, label: {
                Text("Finished!!")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .frame(height: 60)
                    .frame(maxWidth: .infinity)
                    .background(Color.MyTheme.orangeColor)
                    .cornerRadius(12)
                    .padding(.horizontal)
            })
            .accentColor(Color.MyTheme.blueColor)
            .opacity(displayName.isEmpty ? 0.0 : 1.0)
            .animation(.easeOut(duration:1.0))
            
        })
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.MyTheme.beigeColor)
        .edgesIgnoringSafeArea(.all)
        .alert(isPresented: $showError){() -> Alert in
            return Alert(title: Text("Error creating profile 😤"))
        }
         
        .onAppear(perform: {
            if displayName == initialAnonymousName{
                displayName = ""
            }else{
                return
            }
        })
    }
    
    //MARK: FUNCTIONS
    func createProfile(){
        print("CREATE PROFILE NOW")
        
        AuthService.instance.createNewUserInDatabase(name: displayName, email: email, providerID: providerID, provider: provider, profileImage: imageSelected){ (returnUserID) in
            
            if let userID = returnUserID {
                // SUCCESS
                print("Successfully created new user in database.")
                AuthService.instance.logInUserToApp(userID: userID) { (success) in
                    if success {
                        print("User logged in!")
                        // return to app
                        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                        
                        
                    }else{
                        print("Error logging in!")
                        self.showError.toggle()
                    }
                }
            }else {
                // ERROR
                print("Error creating user in Database")
                self.showError.toggle()
            }
        }
    }
    
}

struct OnboardingViewPart2_Previews: PreviewProvider {
    @State static var testString: String = "Test"
    
    
    static var previews: some View {
        OnboardingViewPart2(displayName: $testString, email: $testString, providerID: $testString, provider: $testString)
    }
}
