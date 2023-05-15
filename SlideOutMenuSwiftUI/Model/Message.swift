//
//  Message.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import Foundation

struct Message: Identifiable {
    var id = UUID()
    var sender: User
    var dateSent: Date = Date()
}
