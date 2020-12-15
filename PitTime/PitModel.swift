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
    var postID: String
    var userID: String
    var username: String
    var dateCreated: Date
    var pitTime: String

    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
