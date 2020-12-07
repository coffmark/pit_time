//
//  ProfileHeaderView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/26.
//

import SwiftUI

struct ProfileHeaderView: View {
    @Environment(\.presentationMode) var presentationMode
    let sourceType: UIImagePickerController.SourceType = .photoLibrary
        
    @Binding var profileImage: UIImage
    @Binding var profileDisplayName: String
    
    @State var showProfileImage: Bool = false
    
    
    
    
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
            .sheet(isPresented: $showProfileImage, content: {
                ImagePicker(imageSelected: $profileImage, sourceType: sourceType)
            })
            Text(profileDisplayName.uppercased())
                .font(.title)
                .fontWeight(.bold)
        })
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    
    @State static var uiImage: UIImage = UIImage(named: "noimage")!
    @State static var profileDisplayPreviewName: String = "Ryosuke"
    
    static var previews: some View {
        ProfileHeaderView(profileImage: $uiImage, profileDisplayName: $profileDisplayPreviewName)
            .previewLayout(.sizeThatFits)
    }
}
