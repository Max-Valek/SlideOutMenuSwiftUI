//
//  NotificationsListView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct NotificationsListView: View {
    
    let notifications: [UserNotification]
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            if !notifications.isEmpty {
                
                ForEach(notifications) { notification in
                    NotificationItemView(notification: notification)
                    Divider()
                }
                
            } else {
                Text("No notifications yet")
            }
        }
        .padding(.top, 8)
    }
}

struct NotificationsListView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsListView(notifications: UserNotification.sampleAll)
    }
}
