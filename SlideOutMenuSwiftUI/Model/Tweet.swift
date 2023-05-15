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

extension Tweet {
    
    static var allTweets: [Tweet] = [
        Tweet(author: User.doge, text: "This is a sample tweet by the mascot for DogeCoin.")
    ]
}
