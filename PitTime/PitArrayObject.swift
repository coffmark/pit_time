//
//  PitModelArrayObject.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import Foundation

class PitArrayObject: ObservableObject {
    @Published var pitArray = [PitModel]()

    init() {
        print("FETCH FROM DATABASE HERE")

        let pit1 = PitModel(postID: "", userID: "", username: "John", dateCreated: Date(), pitTime: "2020-11-30 22:56:49 +0000")
        let pit2 = PitModel(postID: "", userID: "", username: "Kamimura", dateCreated: Date(), pitTime: "2020-11-30 22:56:49 +0000")
        let pit3 = PitModel(postID: "", userID: "", username: "Merry", dateCreated: Date(), pitTime: "2020-11-30 22:56:49 +0000")
        let pit4 = PitModel(postID: "", userID: "", username: "Becky", dateCreated: Date(), pitTime: "2020-11-30 22:56:49 +0000")

        self.pitArray.append(pit1)
        self.pitArray.append(pit2)
        self.pitArray.append(pit3)
        self.pitArray.append(pit4)
    }

    init(shuffled: Bool) {
        print("GET POSTS FOR FEED > SHUFFLED : \(shuffled)")
        DataService.instance.downloadPostsForFeed { returnedPosts in
            if shuffled {
                let shufflePosts = returnedPosts.shuffled()
                self.pitArray.append(contentsOf: shufflePosts)
            } else {
                self.pitArray.append(contentsOf: returnedPosts)
            }
        }
    }

}
