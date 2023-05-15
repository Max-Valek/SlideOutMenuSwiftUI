//
//  TweetView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct TweetView: View {
    
    var tweet: Tweet
    
    var body: some View {
        
        
            HStack(alignment: .top) {
                
                // author profile photo
                authorImage
                
                // everything else
                VStack(alignment: .leading, spacing: 8) {
                    // user info and ellipsis button
                    tweetTop
                    
                    NavigationLink {
                        TweetDetailView(tweet: tweet)
                    } label: {
                        // tweet content
                        content
                    }
                    
                    // buttons
                    tweetButtons
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 4)
        
    }
}

struct TweetView_Previews: PreviewProvider {
    static var previews: some View {
        TweetView(tweet: Tweet.allTweets[0])
    }
}

extension TweetView {
    // tweet author profile photo
    private var authorImage: some View {
        // author profile photo
        VStack {
            Image(tweet.author.profileImage ?? "default")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
        }
        .frame(width: 50)
    }
    // user info and ellipsis button
    private var tweetTop: some View {
        HStack {
            Text(tweet.author.displayName)
                .font(.headline)
                .fontWeight(.semibold)
            
            Text("@\(tweet.author.username)")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(Color.theme.darkGray)
            
            Spacer()
            
            Menu {
                Button("Unfollow", action: {})
                Button("Mute", action: {})
                Button("Block", action: {})
                Button("Report Tweet", action: {})
            } label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(Color.theme.darkGray)
            }
        }
    }
    // tweet content
    private var content: some View {
        VStack(alignment: .leading) {
            Text(tweet.text)
                .multilineTextAlignment(.leading)
        }
    }
    // tweet buttons
    private var tweetButtons: some View {
        HStack {
            // replies
            Button {
            } label: {
                HStack {
                    Image(systemName: "bubble.left")
                    Text("\(tweet.replies.count)")
                }
            }
            
            Spacer()
            
            // retweets
            Button {
            } label: {
                HStack {
                    Image(systemName: "arrow.triangle.2.circlepath")
                    Text("\(tweet.usersReposted.count)")
                }
            }
            
            Spacer()
            
            // likes
            Button {
            } label: {
                HStack {
                    Image(systemName: "heart")
                    Text("\(tweet.usersLiked.count)")
                }
            }
            
            Spacer()
            
            // views
            Button {
            } label: {
                HStack {
                    Image(systemName: "chart.bar.xaxis")
                    Text("0")
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
        .font(.subheadline)
        .fontWeight(.semibold)
        .foregroundColor(Color.theme.darkGray)
    }
}
