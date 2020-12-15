//
//  PostImageView.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/06.
//

import SwiftUI

struct PostImageView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme

    @Binding var headerImage: UIImage
    @AppStorage(CurrentUserDefaults.displayName) var currentUserDisplayName: String?
    @AppStorage(CurrentUserDefaults.userID) var currentUserID: String?

    // Alert
    @State var showAlert: Bool = false
    @State var postUploadSuccessfully: Bool = false

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "xmark")
                        .font(.title)
                        .padding()
                })
                .accentColor(.primary)
                Spacer()
            }
        }

        ScrollView(.vertical, showsIndicators: false) {
            Image(uiImage: headerImage)
                .resizable()
                .scaledToFill()

            Button(action: {
                postPicture(profileImage: headerImage )
            }, label: {
                Text("Post Picture!".uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 60)
            })
        }
        .alert(isPresented: $showAlert) { () -> Alert in
            getAlert()
        }
    }

    func postPicture(profileImage: UIImage) {
        print("POST PICTURE TO CAPTION HERE")
        guard let userID = currentUserID else {
            print("Error getting userID or displayName while posting image")
            return
        }
        ImageManager.instance.uploadProfileImage(userID: userID, image: profileImage)

    }

    func getAlert() -> Alert {
        if postUploadSuccessfully {
            return Alert(title: Text("Successfully Upload Post!"), message: nil, dismissButton: .default(Text("OK"), action: {
                self.presentationMode.wrappedValue.dismiss()
            }))
        } else {
            return Alert(title: Text("Error Uploading Post"))
        }
    }
}

struct PostImageView_Previews: PreviewProvider {
    @State static var image = UIImage(named: "noimage")!

    static var previews: some View {
        PostImageView(headerImage: $image)
    }
}
