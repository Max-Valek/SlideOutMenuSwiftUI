//
//  ConversationView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct ConversationView: View {
    
    let conversation: Conversation
    
    var body: some View {
        Text(conversation.users[0].displayName)
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView(conversation: Conversation.sampleConversations[0])
    }
}
