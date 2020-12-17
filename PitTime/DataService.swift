//
//  DataService.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/30.
//

import Foundation
import SwiftUI
import FirebaseFirestore

class DataService {
    // MARK: PROPERTIES

    static let instance = DataService()
    private var REF_POSTS = dbBase.collection("posts")

    // MARK: UPLOAD FUNCTIONS
    func uploadPostOnlyBeginTime(pitBeginTime: String, displayName: String, userID: String, handler: @escaping(_ success: Bool) -> Void) {

        // Create new post document
        let document = REF_POSTS.document()
        let postID = document.documentID

        // Upload data to Database
        let postData: [String: Any] = [
            DatabasePostField.postID: postID,
            DatabasePostField.userID: userID,
            DatabasePostField.displayName: displayName,
            DatabasePostField.pitBeginTime: pitBeginTime,
            DatabasePostField.dateCreated: FieldValue.serverTimestamp()
        ]

        document.setData(postData) {error in
            if let error = error {
                print("Error uploading data to post document.\(error)")
                handler(false)
                return
            } else {
                // return back to the app
                handler(true)
                return
            }
        }
        document.setData(postData)
    }
    
    func uploadPostAddEndTime(pitEndTime: String, userID: String, postID: String, handler: @escaping(_ success: Bool) -> Void) {
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    // MARK: DOWNLOAD FUNCTIONS
    func downloadPostsForFeed(handler: @escaping(_ posts: [PitModel]) -> Void) {
        REF_POSTS.order(by: DatabasePostField.userID, descending: true).limit(to: 50).getDocuments { querySnapshot, _ in

            handler(self.getPostFromSnapshot(querySnapshot: querySnapshot))
        }
    }

    // MARK: PRIVATE FUNCTIONS
    private func getPostFromSnapshot(querySnapshot: QuerySnapshot?) -> [PitModel] {
        var postArray = [PitModel]()
        if let snapshot = querySnapshot, snapshot.documents.count > 0 {
            for document in snapshot.documents {
                if let userID = document.get(DatabasePostField.userID) as? String,
                   let displayName = document.get(DatabasePostField.displayName) as? String,
                   let timestamp = document.get(DatabasePostField.dateCreated) as? Timestamp,
                   let pitBeginTime = document.get(DatabasePostField.pitBeginTime) as? String {
                    let date = timestamp.dateValue()
                    let postID = document.documentID

                    let newPost = PitModel(postID: postID, userID: userID, username: displayName, dateCreated: date, pitBeginTime: pitBeginTime)

                    postArray.append(newPost)
                }
            }
            return postArray
        } else {
            print("No documents in snapshot found for this user")
            return postArray
        }
    }
}
