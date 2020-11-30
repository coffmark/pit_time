//
//  DataService.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/30.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class DataService{
    //MARK: PROPERTIES
    
    static let instance = DataService()
    private var REF_POSTS = DB_BASE.collection("posts")
    
    //MARK: CREATE FUNCTIONS
    func uploadPost(pitTime: String, displayName: String, userID: String, handler: @escaping(_ success: Bool) -> ()){
        
        // Create new post document
        let document = REF_POSTS.document()
        let postID = document.documentID
        
        // Upload data to Database
        let postData: [String: Any] = [
            DatabasePostField.postID : postID,
            DatabasePostField.userID : userID,
            DatabasePostField.displayName: displayName,
            DatabasePostField.pitTime: pitTime,
            DatabasePostField.dateCreated: FieldValue.serverTimestamp(),
        ]
        
        document.setData(postData){(error) in
            if let error = error{
                print("Error uploading data to post document.\(error)")
                handler(false)
                return
            }else{
                // return back to the app
                handler(true)
                return
            }
        }
        document.setData(postData)
    }
}
