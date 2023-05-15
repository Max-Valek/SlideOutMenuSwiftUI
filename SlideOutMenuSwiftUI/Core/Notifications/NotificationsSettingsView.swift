//
//  NotificationsSettingsView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct NotificationsSettingsView: View {
    
    let loggedInUser: User
    @Environment(\.dismiss) var dismiss
    
    
    var body: some View {
        
        ZStack {
            Color.theme.black.ignoresSafeArea()
            
            VStack {
                // header
                header
                
                Spacer()
            }
            
        }
        .foregroundColor(Color.theme.text)
        
    }
}

struct NotificationsSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsSettingsView(loggedInUser: User.elon)
    }
}

extension NotificationsSettingsView {
    // header
    private var header: some View {
        HStack {
            // for formatting
            Button("Done") {}
            .opacity(0)
            
            Spacer()
            
            VStack {
                Text("Notifications")
                Text("@\(loggedInUser.username)")
                    .font(.subheadline)
                    .foregroundColor(Color.theme.lightGray)
                    
            }
            
            Spacer()
            
            Button("Done") {
                dismiss()
            }
            
        }
        .fontWeight(.semibold)
        .padding(.vertical, 8)
        .padding(.horizontal)
        .background(Color.theme.text.opacity(0.025))
    }
}
