//
//  ProfileTab.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import Foundation

// MARK: - Enum for profile tabs

enum ProfileTab: CaseIterable {
    case tweets, replies, media, likes
}

// title and image properties
extension ProfileTab: Identifiable {
    
    var id: Int {
        switch self {
        case .tweets:
            return 0
        case .replies:
            return 1
        case .media:
            return 2
        case .likes:
            return 3
        }
    }
    
    var title: String {
        switch self {
        case .tweets:
            return "Tweets"
        case .replies:
            return "Replies"
        case .media:
            return "Media"
        case .likes:
            return "Likes"
        }
    }
    
    var index: Int {
        switch self {
        case .tweets:
            return 1
        case .replies:
            return 2
        case .media:
            return 3
        case .likes:
            return 4
        }
    }
}
