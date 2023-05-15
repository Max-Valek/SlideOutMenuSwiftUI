//
//  TweetDetailView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct TweetDetailView: View {
    
    var tweet: Tweet
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        ZStack {
            Color.theme.black.ignoresSafeArea()
            
            VStack {
                
                header
                
                ScrollView(.vertical) {
                    tweetTop
                    tweetContent
                    tweetEngagements
                    tweetButtons
                    
                    if !tweet.replies.isEmpty {
                        TweetListView(tweetList: tweet.replies)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 8)
                
                Spacer()
            }
        }
        .foregroundColor(Color.theme.text)
        // make custom header instead
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct TweetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TweetDetailView(tweet: Tweet.allTweets[0])
    }
}

extension TweetDetailView {
    // header
    private var header: some View {
        HStack {
            Button {
                dismiss()
            } label: {
                Image(systemName: "arrow.left")
                    .font(.title3)
            }
            Spacer()
            
            Text("Tweet")
                .font(.headline)
            
            Spacer()
            
            Image(systemName: "info.circle")
                .font(.title3)
                .opacity(0)
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.theme.white.opacity(0.025))
    }
    // tweet top (user info, ellipsis button)
    private var tweetTop: some View {
        HStack(spacing:16) {
            Image(tweet.author.profileImage ?? "default")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                HStack(spacing: 4) {
                    Text(tweet.author.displayName)
                        .font(.headline)
                    if tweet.author.isVerified {
                        Image(systemName: "checkmark.seal.fill")
                            .font(.caption)
                            .foregroundColor(Color.theme.blue)
                    }
                }
                
                Text("@\(tweet.author.username)")
                    .font(.subheadline)
                    .foregroundColor(Color.theme.lightGray)
            }
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(Color.theme.lightGray)
            }

        }
    }
    // tweet content
    private var tweetContent: some View {
        HStack {
            Text(tweet.text)
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer(minLength: 0)
        }
        .padding(0)
        .frame(maxWidth: .infinity)
        .padding(.vertical)
    }
    // engagement info
    private var tweetEngagements: some View {
        VStack {
            // time, date, views (sample)
            HStack(alignment: .center, spacing: 4) {
                Text("4:00 PM")
                Text("•")
                Text("5/15/23")
                Text("•")
                Text("0")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.text)
                Text("Views")
                Spacer()
            }
            .font(.caption)
            .foregroundColor(Color.theme.lightGray)
            
            Divider()
            
            // retweets, quotes, likes, bookmarks
            HStack(spacing: 8) {
                HStack(spacing: 4) {
                    Text("\(tweet.usersReposted.count)")
                        .foregroundColor(Color.theme.text)
                        .fontWeight(.semibold)
                    Text("Retweets")
                }
                // have to implement quotes
                HStack(spacing: 4) {
                    Text("0")
                        .foregroundColor(Color.theme.text)
                        .fontWeight(.semibold)
                    Text("Quotes")
                }
                HStack(spacing: 4) {
                    Text("\(tweet.usersLiked.count)")
                        .foregroundColor(Color.theme.text)
                        .fontWeight(.semibold)
                    Text("Likes")
                }
                // have to implement bookmarks
                HStack(spacing: 4) {
                    Text("0")
                        .foregroundColor(Color.theme.text)
                        .fontWeight(.semibold)
                    Text("Bookmarks")
                }
                
                Spacer()
            }
            .font(.subheadline)
            .foregroundColor(Color.theme.lightGray)
            
            Divider()
        }
    }
    // tweet buttons
    private var tweetButtons: some View {
        VStack {
            HStack {
                // replies
                Button {
                } label: {
                    HStack {
                        Image(systemName: "bubble.left")
                    }
                }
                
                Spacer()
                
                // retweets
                Button {
                } label: {
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath")
                    }
                }
                
                Spacer()
                
                // likes
                Button {
                } label: {
                    HStack {
                        Image(systemName: "heart")
                    }
                }
                
                Spacer()
                
                Button {
                } label: {
                    HStack {
                        Image(systemName: "bookmark")
                    }
                }
                
                Spacer()
                
                // share
                Button {
                } label: {
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                    }
                }
            }
            .font(.headline)
            .fontWeight(.semibold)
            .foregroundColor(Color.theme.darkGray)
            .padding(.horizontal, 24)
            
            Divider()
        }
    }

}
