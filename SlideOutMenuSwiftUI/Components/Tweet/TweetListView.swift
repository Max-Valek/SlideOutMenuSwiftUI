//
//  TweetListView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct TweetListView: View {
    
    let tweetList: [Tweet]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            ForEach(tweetList) { tweet in
                TweetView(tweet: tweet)
                Divider()
            }
        }
    }
}

struct TweetListView_Previews: PreviewProvider {
    static var previews: some View {
        TweetListView(tweetList: Tweet.allTweets)
    }
}
