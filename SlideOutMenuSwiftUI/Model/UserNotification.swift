//
//  Notification.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct UserNotification: Identifiable {
    var id = UUID()
    let type: NotificationType
    let user: User
}

enum NotificationType {
    case like, retweet, follow
}

extension NotificationType {
    
    var icon: String {
        switch self {
        case .like:
            return "heart.fill"
        case .retweet:
            return "arrow.triangle.2.circlepath"
        case .follow:
            return "person.fill"
        }
    }
    
    var iconColor: Color {
        switch self {
        case .like:
            return Color.red
        case .retweet:
            return Color.green
        case .follow:
            return Color.theme.blue
        }
    }
}

extension UserNotification {
    
    static var sampleAll: [UserNotification] = [
        UserNotification(type: .follow, user: User.doge),
        UserNotification(type: .like, user: User.doge),
        UserNotification(type: .retweet, user: User.doge),
        UserNotification(type: .follow, user: User.defaultUser),
        UserNotification(type: .like, user: User.defaultUser),
        UserNotification(type: .retweet, user: User.defaultUser)
    ]
}
