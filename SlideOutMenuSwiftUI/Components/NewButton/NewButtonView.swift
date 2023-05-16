//
//  NewButton.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

// Button on the bottom right of the screen (new tweet/message)
struct NewButtonView: View {
    
    let loggedInUser: User
    @State private var showNewTweet: Bool = false
    @State private var showNewMessage: Bool = false
    let icon: String
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    if icon == "plus" {
                        showNewTweet.toggle()
                    } else if icon == "envelope" {
                        showNewMessage.toggle()
                    }
                } label: {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(Color.theme.text)
                        .padding(16)
                        .background(Color.theme.blue, in: Circle())
                }
            }
            .padding(.trailing)
            .padding(.bottom)
        }
        .fullScreenCover(isPresented: $showNewTweet) {
            NewTweetView(loggedInUser: loggedInUser)
        }
        .fullScreenCover(isPresented: $showNewMessage) {
            NewMessageView()
        }
    }
}

struct NewButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NewButtonView(loggedInUser: User.elon, icon: "plus")
    }
}
