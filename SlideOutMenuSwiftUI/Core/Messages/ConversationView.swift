//
//  ConversationView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct ConversationView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let conversation: Conversation
    
    var body: some View {
        ZStack {
            Color.theme.black.ignoresSafeArea()
            
            VStack {
                // header
                header
                
                Spacer()
                
                messageTextField
            }
        }
        .foregroundColor(Color.theme.text)
        // make custom header instead
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView(conversation: Conversation.sampleConversations[0])
    }
}

extension ConversationView {
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
            VStack {
                Image(conversation.users[0].profileImage ?? "default")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 30, height: 30)
                    .clipShape(Circle())
                
                Text(conversation.users[0].displayName)
                    .font(.headline)
            }
            Spacer()
            Button {
                dismiss()
            } label: {
                Image(systemName: "info.circle")
                    .font(.title3)
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.theme.white.opacity(0.025))
    }
    
    // new message text field
    private var messageTextField: some View {
        VStack {
            Divider()
            HStack(spacing: 20) {
                Image(systemName: "photo")
                    .font(.title3)
                    .foregroundColor(Color.theme.text)
                
                Text("Start a message")
                
                Spacer()
                
                Image(systemName: "arrowtriangle.right.fill")
                    .font(.title3)
            }
            .foregroundColor(Color.theme.lightGray)
            .padding()
            .background(Color.theme.twitterBlack, in: Capsule())
            .padding(.horizontal)
        }
        .padding(.vertical, 8)
    }
}
