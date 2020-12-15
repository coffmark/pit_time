//
//  ProfileHeaderView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    @AppStorage(CurrentUserDefaults.userID) var currentUserID: String?
    //PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    let sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    // BINDING PROPERTIES
    @Binding var profileImage: UIImage
    @Binding var profileDisplayName: String
    
    // SHEET TOGGLE
    @State var showProfileImage: Bool = false
    @State var showUploadError: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Button(action: {
                // change Image
                self.showProfileImage.toggle()
            }, label: {
                Image(uiImage: profileImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .background(Color(.systemPink))
                    .cornerRadius(40)
            })
            .sheet(isPresented: $showProfileImage, onDismiss: afterChoosePhoto, content: {
                ImagePicker(imageSelected: $profileImage, sourceType: sourceType)
            })
            Text(profileDisplayName.uppercased())
                .font(.title)
                .fontWeight(.bold)
        })
        .alert(isPresented: $showUploadError, content: {
            Alert(title: Text("Error"), message: Text("アップロードすることができませんでした。AppleかGoogleでサインインしてください"), dismissButton: .default(Text("OK")))
        })
    }
    
    func afterChoosePhoto(){
        if let userID = currentUserID {
            ImageManager.instance.uploadProfileImage(userID: userID, image: profileImage)
            print("Catch Upload Image Function")
        }else{
            self.showUploadError.toggle()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {

    @State static var uiImage = UIImage(named: "noimage")!
    @State static var profileDisplayPreviewName: String = "Ryosuke"

    static var previews: some View {
        ProfileHeaderView(profileImage: $uiImage, profileDisplayName: $profileDisplayPreviewName)
            .previewLayout(.sizeThatFits)
    }
}
