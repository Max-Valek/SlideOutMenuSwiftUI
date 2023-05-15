//
//  Conversation.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import Foundation

struct Conversation: Identifiable {
    var id = UUID()
    var users: [User]
    var messages: [Message] = []
}
