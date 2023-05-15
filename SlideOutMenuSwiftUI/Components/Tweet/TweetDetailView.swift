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
}
