//
//  Enum & Structs.swift
//  PitTime
//
//  Created by 神村亮佑 on 2020/11/24.
//

import Foundation

struct DatabaseUserField{ // Fields within the User Document in Database
    static let displayName: String = "display_name"
    static let email: String = "email"
    static let providerID: String = "provider_id"
    static let provider: String = "provider"
    static let userID: String = "user_id"
    static let bio: String = "bio"
    static let dateCreated: String = "date_created"
}

struct DatabasePostField{// Fields within Post Document in Database
    static let postID = "post_id"
    static let userID = "user_id"
    static let displayName = "display_name"
    static let pitTime = "pit_time"
    static let dateCreated = "date_created"
}


struct CurrentUserDefaults{ // Fields for UserDefaults saved within app
    static let displayName = "display_name"
    static let bio = "bio"
    static let userID = "user_id"
    
}
