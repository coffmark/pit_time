//
//  NFCWriteService.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/12/18.
//

import SwiftUI

struct NFCWriteService {
    @AppStorage(CurrentUserDefaults.userID) var currentUserID: String?
    @AppStorage(CurrentUserDefaults.displayName) var currentUserDisplayName: String?
    
    static let instance = NFCWriteService()
    
    // MARK: FUNCTIONS
    func postCloudStoreOnlyBeginTime(beginTime: String) {
        print("POST CLOUD STORE")
        guard let userID = currentUserID, let displayName = currentUserDisplayName else {
            print("Error getting userID or displayName")
            return
        }
        DataService.instance.uploadPostOnlyBeginTime(pitBeginTime: beginTime, displayName: displayName, userID: userID) { success in
            if success {
                print("Success Post!")
            } else {
                print("Error uploading post!")
            }
        }
    }
    
    func AddEndTimeInCloudStore(pitEndTime: String, postID: String){
        print("POST CLOUD STORE FOR END TIME")
        guard let userID = currentUserID else {
            print("Error getting userID")
            return
        }
        
        // Uplaod Post End Time And Use Post ID
        DataService.instance.uploadPostAddEndTime(pitEndTime: pitEndTime, userID: userID, postID: postID) { (success) in
            if success {
                print("Success POST!")
            }else{
                print("Error uploading post!")
            }
        }
    }
}
