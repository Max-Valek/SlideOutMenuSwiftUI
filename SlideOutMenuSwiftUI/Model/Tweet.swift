//
//  Tweet.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct Tweet: Identifiable {
    var id = UUID()
    let author: User
    let text: String
    var image: Image?
    var usersLiked: [User] = []
    var usersReposted: [User] = []
    var replies: [Tweet] = []
    var originalTweetID: UUID?
}
