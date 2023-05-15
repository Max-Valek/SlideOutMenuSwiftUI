//
//  NotificationsTab.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import Foundation

// enum for notifications view tabs

enum NotificationsTab: CaseIterable {
    case all, verified, mentions
}

extension NotificationsTab {
    var title: String {
        switch self {
        case .all:
            return "All"
        case .verified:
            return "Verified"
        case .mentions:
            return "Mentions"
        }
    }
}
