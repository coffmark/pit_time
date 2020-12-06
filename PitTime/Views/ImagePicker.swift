//
//  ImagePicker.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/05.
//

import Foundation
import SwiftUI

struct ImagePicker: UIViewControllerRepresentable{
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var imageSelected: UIImage
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> some UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: UIViewControllerRepresentableContext<ImagePicker>) {
        
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        return ImagePickerCoordinator(parent: self)
    }
    
    class ImagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate{
        
        let parent: ImagePicker
        init(parent: ImagePicker){
            self.parent = parent
        }
        
        private func imagePickerController(_ picker: UIImagePickerController, didFinishPickerMediaWithInfo info: [UIImagePickerController.InfoKey: Any]){
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                // select the image for our app
                parent.imageSelected = image
                // dismiss the screen
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
