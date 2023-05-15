//
//  ConversationsListView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct ConversationsListView: View {
    
    let user: User
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            // message requests
            HStack(spacing: 16) {
                Image(systemName: "envelope.badge")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .padding(10)
                    .background(Color.theme.black, in: Circle())
                    .padding(2)
                    .background(Color.theme.twitterBlack, in: Circle())
                
                Text("Message Requests")
                    .font(.headline)
                Spacer()
            }
            
            // conversations
            ForEach(user.conversations) { convo in
                
                NavigationLink {
                    ConversationView(conversation: convo)
                } label: {
                    HStack(alignment: .top, spacing: 16) {
                        Image(convo.users[0].profileImage ?? "default")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack {
                            // name and username (will have to change for groups)
                            HStack {
                                Text(convo.users[0].displayName)
                                    .font(.headline)
                                    .foregroundColor(Color.theme.text)
                                
                                Text("@\(convo.users[0].username)")
                                Spacer()
                            }
                            
                            // description (will have to change)
                            HStack {
                                Text("Latest message from @\(convo.users[0].username)")
                                Spacer()
                            }
                        }
                        .font(.subheadline)
                        .foregroundColor(Color.theme.lightGray)
                        
                        Spacer()
                    }
                    .padding(.top, 8)
                }
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
    }
}

struct ConversationsListView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsListView(user: User.elon)
    }
}
