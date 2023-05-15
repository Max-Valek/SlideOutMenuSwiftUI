//
//  User.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import Foundation

struct User: Identifiable {
    var id = UUID()
    var username: String
    var displayName: String
    var isVerified: Bool = false
    var profileImage: String?
    var headerImage: String?
    var bio: String?
    var dateJoined: Date = Date()
    var location: String?
    var following: [User] = []
    var followers: [User] = []
    
    var tweets: [Tweet] = []
    var replies: [Tweet] = []
    var media: [Tweet] = []
    var likedTweets: [Tweet] = []
    
    var conversations: [Conversation] = []
    
    var notifications: [UserNotification] = []
    
    var verifiedNotifications: [UserNotification] {
        let verified = notifications.filter { notification in
            return notification.user.isVerified
        }
        return verified
    }
    
    var mentionNotifications: [UserNotification] {
        let mentions = notifications.filter({ $0.type == .mention })
        return mentions
    }
}

// sample users
extension User {
    
    static var elon: User =
        User(username: "elon",
            displayName: "Elon Musk",
            isVerified: true,
            profileImage: "elon",
            headerImage: nil,
            bio: "Owner of Twitter",
            location: "Twitter HQ",
            conversations: Conversation.sampleConversations,
            notifications: UserNotification.sampleAll)
    
    static var doge: User =
        User(username: "doge",
            displayName: "Doge",
            isVerified: true,
            profileImage: "doge",
            headerImage: nil,
            bio: "Mascot for Dogecoin",
            location: "Doge")
    
    static var defaultUser: User =
        User(username: "default",
            displayName: "Default User",
            isVerified: false,
            profileImage: "default",
            headerImage: nil,
            bio: "Default user bio",
            location: "Nowhere")
}
