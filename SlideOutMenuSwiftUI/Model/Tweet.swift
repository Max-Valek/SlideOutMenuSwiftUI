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
        Tweet(author: User.doge, text: "This is a sample tweet by the mascot for DogeCoin."),
        Tweet(author: User.defaultUser, text: "This is a sample tweet by Default User."),
        Tweet(author: User.elon, text: "This is a sample tweet by Elon Musk.")
    ]
    
    static var sampleForYou: [Tweet] = [
        Tweet(author: User.doge, text: "This is a sample tweet by Doge for the For You page."),
        Tweet(author: User.defaultUser, text: "This is a sample tweet by Default User for the For You page."),
        Tweet(author: User.elon, text: "This is a sample tweet by Elon Musk for the For You page."),
        Tweet(author: User.doge, text: "This is a sample tweet by Doge for the For You page."),
        Tweet(author: User.defaultUser, text: "This is a sample tweet by Default User for the For You page."),
        Tweet(author: User.elon, text: "This is a sample tweet by Elon Musk for the For You page."),
        Tweet(author: User.doge, text: "This is a sample tweet by Doge for the For You page."),
        Tweet(author: User.defaultUser, text: "This is a sample tweet by Default User for the For You page."),
        Tweet(author: User.elon, text: "This is a sample tweet by Elon Musk for the For You page.")
    ]
    
    static var sampleFollowing: [Tweet] = [
        Tweet(author: User.elon, text: "This is a sample tweet by Elon Musk for the Following page."),
        Tweet(author: User.defaultUser, text: "This is a sample tweet by Default User for the Following page."),
        Tweet(author: User.doge, text: "This is a sample tweet by Doge for the Following page."),
        Tweet(author: User.elon, text: "This is a sample tweet by Elon Musk for the Following page."),
        Tweet(author: User.defaultUser, text: "This is a sample tweet by Default User for the Following page."),
        Tweet(author: User.doge, text: "This is a sample tweet by Doge for the Following page."),
        Tweet(author: User.elon, text: "This is a sample tweet by Elon Musk for the Following page."),
        Tweet(author: User.defaultUser, text: "This is a sample tweet by Default User for the Following page."),
        Tweet(author: User.doge, text: "This is a sample tweet by Doge for the Following page.")
    ]
}
