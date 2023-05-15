//
//  NotificationItemView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI



struct NotificationItemView: View {
    
    var notification: UserNotification
    
    var body: some View {
        
        HStack(alignment: .top) {
            
            // author profile photo
            notificationIcon
            
            // everything else
            VStack(alignment: .leading, spacing: 8) {
                
                userImage
                
                // user info and ellipsis button
                description
            }
        }
        .padding(.horizontal)
        .padding(.vertical, 4)
    }
}

struct NotificationItemView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationItemView(notification: UserNotification.sampleAll[0])
    }
}

extension NotificationItemView {
    // notification icon
    private var notificationIcon: some View {
        VStack {
            Image(systemName: notification.type.icon)
                .font(.title3)
                .foregroundColor(notification.type.iconColor)
        }
        .frame(width: 50)
    }
    // user image
    private var userImage: some View {
        Image(notification.user.profileImage ?? "default")
            .resizable()
            .scaledToFill()
            .frame(width: 35, height: 35)
            .clipShape(Circle())
    }
    // notification description
    private var description: some View {
        HStack {
            Text(notification.user.displayName)
            
            switch notification.type {
            case .like:
                Text("liked your Tweet")
            case .retweet:
                Text("Retweeted your Tweet")
            case .follow:
                Text("followed you")
            }
        
            Spacer()
        }
        .font(.headline)
        .fontWeight(.semibold)
    }
}
