//
//  PitModelArrayObject.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import Foundation

class PitArrayObject: ObservableObject {
    @Published var pitArray = [PitModel]()

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

    init(userID: String) {
        print("GET POSTS FOR USER ID")
        DataService.instance.downloadPostsForProfile(userID: userID) { returnedPosts in
            self.pitArray.append(contentsOf: returnedPosts)
        }
    }
}
