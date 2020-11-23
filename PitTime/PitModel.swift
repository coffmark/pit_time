//
//  PitModel.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/23.
//

import Foundation
import SwiftUI

struct PitModel: Identifiable, Hashable {
    
    var id = UUID()
    var timeID: String
    var userID: String
    var username: String
    var dateCreated: Date
    var likeCount: Int
    var likedByUser: Bool
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
