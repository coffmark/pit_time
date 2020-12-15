//
//  ImageManager.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/07.
//

import Foundation
import FirebaseStorage

let imageCache = NSCache<AnyObject, UIImage>()

class ImageManager {

    // MARK: PROPERTIES
    static let instance = ImageManager()

    private var REF_STOR = Storage.storage()

    // MARK: FUNCTIONS
    func uploadProfileImage(userID: String, image: UIImage) {
        // Get the path where we will save the image
        let path = getProfileImagePath(userID: userID)

        // Save image to path
        DispatchQueue.global(qos: .userInteractive).async {
            self.uploadImage(path: path, image: image) { _ in

            }
        }
    }

    // MARK: PRIVATE FUNCTIONS
    private func getProfileImagePath(userID: String) -> StorageReference {
        let userPath = "users/\(userID)/profile"
        let storagePath = REF_STOR.reference(withPath: userPath)
        return storagePath
    }

    private func uploadImage(path: StorageReference, image: UIImage, handler: @escaping (_ success: Bool) -> Void) {

        var compression: CGFloat = 1.0
        let maxFileSize: Int = 240 * 240
        let maxCompression: CGFloat = 0.05

        guard var originalData = image.jpegData(compressionQuality: compression) else {
            print("Error getting data from image")
            handler(false)
            return
        }

        // Check maximum file size
        while (originalData.count > maxFileSize) && (compression > maxCompression) {
            compression -= 0.05
            if let compressionData = image.jpegData(compressionQuality: compression) {
                originalData = compressionData
            }
            print(compression)
        }

        // Get Image Data
        guard let finalData = image.jpegData(compressionQuality: compression) else {
            print("ERROR GETTING DATA FROM IMAGE")
            handler(false)
            return
        }

        // Get photo matadata
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"

        // Save data to path
        path.putData(finalData, metadata: metadata) {_, error in
            if let error = error {
                // Error
                print("Error uploading image. \(error)")
                handler(false)
                return
            } else {
                // Success
                print("Success uploading image")
                handler(true)
                return
            }
        }

    }
}
