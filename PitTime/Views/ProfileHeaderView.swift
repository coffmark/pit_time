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
        
    @State var headerImage: UIImage = UIImage(named: "noimage")!
    var displayName: String
    
    @State var showProfileImage: Bool = false
    
    
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20, content: {
            Button(action: {
                // change Image
                self.showProfileImage.toggle()
            }, label: {
                Image(uiImage: headerImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .background(Color(.systemPink))
                    .cornerRadius(40)
            })
            .sheet(isPresented: $showProfileImage, onDismiss: onDismiss, content: {
                ImagePicker(imageSelected: $headerImage, sourceType: sourceType)
            })
            Text(displayName.uppercased())
                .font(.title)
                .fontWeight(.bold)
        })
    }
    
    func onDismiss(){
        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
            showProfileImage.toggle()
        }
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(displayName: "Ryosuke Kamimura")
            .previewLayout(.sizeThatFits)
    }
}
