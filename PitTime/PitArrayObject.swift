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
        DataService.instance.downloadPostsForFeed { returnedPosts in
            self.pitArray.append(contentsOf: returnedPosts)
        }
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

    @Published var pitExportArray = [String]()
    // For pitUserText
    init(userID: String, isExports: Bool) {
        if isExports {
            print("GET EXPORT TIME FOR USER ID: \(userID)")
            DataService.instance.downloadAndExportPitTime(userID: userID) { returnedExportTexts in
                self.pitExportArray.append(contentsOf: returnedExportTexts)
            }
        } else {
            print("GET POSTS FOR USER ID: \(userID)")
            DataService.instance.downloadPostsForProfile(userID: userID) { returnedPosts in
                self.pitArray.append(contentsOf: returnedPosts)
            }
        }
    }
}
