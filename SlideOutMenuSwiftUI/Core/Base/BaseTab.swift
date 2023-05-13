//
//  BaseTab.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import Foundation

// MARK: - Enum for nav bar items

enum BaseTab {
    case home, search, notifications, messages
}

// title and image properties
extension BaseTab {
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .search:
            return "Search"
        case .notifications:
            return "Notifications"
        case .messages:
            return "Messages"
        }
    }
    var image: String {
        switch self {
        case .home:
            return "house"
        case .search:
            return "magnifyingglass"
        case .notifications:
            return "bell"
        case .messages:
            return "envelope"
        }
    }
}
