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
    }
    func uploadPostAddEndTime(pitEndTime: String, postID: String, handler: @escaping(_ success: Bool) -> Void) {
        // REFERENCE FORM DOCUMENT
        let document = REF_POSTS.document(postID)

        // Post Data
        let postData: [String: Any] = [
            DatabasePostField.pitEndTime: pitEndTime
        ]
        // Insert Post Data
        document.setData(postData, merge: true) {error in
            if let error = error {
                print("Error uploading data to post document\(error)")
                handler(false)
                return
            } else {
                handler(true)
                return
            }
        }
    }

    // MARK: DOWNLOAD FUNCTIONS
    func downloadPostsForFeed(handler: @escaping(_ posts: [PitModel]) -> Void) {
        REF_POSTS.order(by: DatabasePostField.dateCreated, descending: true).limit(to: 50).getDocuments { querySnapshot, _ in
            handler(self.getPostFromSnapshot(querySnapshot: querySnapshot))
        }
    }

    // MARK: PROFILE DOWNLOAD FUNCTIONS
    func downloadPostsForProfile(userID: String, handler: @escaping(_ posts: [PitModel]) -> Void) {
        REF_POSTS.whereField(DatabasePostField.userID, isEqualTo: userID).limit(to: 50).getDocuments { querySnapshot, error in
            if let error = error {
                print("Error: Download Posts For Profile View\(error)")
            } else {
                handler(self.getPostFromSnapshot(querySnapshot: querySnapshot))
            }
        }
    }

    // MARK: PRIVATE FUNCTIONS
    private func getPostFromSnapshot(querySnapshot: QuerySnapshot?) -> [PitModel] {
        var postArray = [PitModel]()
        if let snapshot = querySnapshot, snapshot.documents.isEmpty != true {
            for document in snapshot.documents {
                if let userID = document.get(DatabasePostField.userID) as? String,
                   let displayName = document.get(DatabasePostField.displayName) as? String,
                   let timestamp = document.get(DatabasePostField.dateCreated) as? Timestamp,
                   let pitBeginTime = document.get(DatabasePostField.pitBeginTime) as? String {

                    let date = timestamp.dateValue()
                    let postID = document.documentID

                    // Check Contain ENDTIME
                    if let pitEndTime = document.get(DatabasePostField.pitEndTime) as? String {
                        let newPost = PitModel(postID: postID, userID: userID, username: displayName, dateCreated: date, pitBeginTime: pitBeginTime, pitEndTime: pitEndTime)
                        postArray.append(newPost)
                    } else {
                        let newPost = PitModel(postID: postID, userID: userID, username: displayName, dateCreated: date, pitBeginTime: pitBeginTime)
                        postArray.append(newPost)
                    }
                }
            }
            return postArray
        } else {
            print("No documents in snapshot found for this user")
            return postArray
        }
    }
}
