//
//  PitModelArrayObject.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import Foundation

class PitArrayObject: ObservableObject {
    @Published var pitArray = [PitModel]()
    
    init(){
        print("FETCH FROM DATABASE HERE")
        let pit1 = PitModel(timeID: "", userID: "", username: "John", dateCreated: Date(), likeCount: 0, likedByUser: false)
        let pit2 = PitModel(timeID: "", userID: "", username: "Ryosuke", dateCreated: Date(), likeCount: 3, likedByUser: false)
        let pit3 = PitModel(timeID: "", userID: "", username: "Kamimu-", dateCreated: Date(), likeCount: 4, likedByUser: false)
        let pit4 = PitModel(timeID: "", userID: "", username: "Merry", dateCreated: Date(), likeCount: 5, likedByUser: false)
        
        self.pitArray.append(pit1)
        self.pitArray.append(pit2)
        self.pitArray.append(pit3)
        self.pitArray.append(pit4)
        
    }
    
}
