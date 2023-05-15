//
//  NotificationsView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct NotificationsView: View {
    
    // for testing
    let loggedInUser: User
    @Binding var showMenu: Bool
    @Namespace private var namespace
    @State private var currentTab: NotificationsTab = .all
    
    var body: some View {
        
        ZStack {
            Color.theme.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                header
                content
                Spacer()
            }
            .foregroundColor(Color.theme.text)
        }
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView(loggedInUser: User.elon, showMenu: .constant(false))
    }
}

extension NotificationsView {
    // header
    private var header: some View {
        VStack(spacing: 0) {
            // profile pic, twitter logo
            HStack(spacing: 20) {
                // profile pic button
                Button {
                    // show menu when profile pic pressed
                    withAnimation {
                        showMenu.toggle()
                    }
                } label: {
                    Image(loggedInUser.profileImage ?? "default")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 35, height: 35)
                        .clipShape(Circle())
                }
                
                Spacer()
                
                // twitter logo
                HStack {
                    Text("Notifications")
                        .font(.headline)
                }
                
                Spacer()
                
                // settings button
                Image(systemName: "gearshape")
                    .font(.title3)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            tabs
            
            Divider()
                .frame(height: 0.75)
                .overlay(Color.theme.darkGray.opacity(0.4))
                .padding(0)
        }
        .padding(0)
        .background(Color.theme.white.opacity(0.025))
    }
    // all, verified, mentions
    private var tabs: some View {
        HStack {
            Spacer()
            
            ForEach(NotificationsTab.allCases, id: \.self) { tab in
                VStack {
                    Text(tab.title)
                        .foregroundColor(currentTab == tab ? Color.theme.text : Color.theme.lightGray)
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.25)) {
                                currentTab = tab
                            }
                        }
                    // tab underline
                    if currentTab == tab {
                        RoundedRectangle(cornerRadius: 2, style: .continuous)
                            .frame(width: 50, height: 3)
                            .foregroundColor(Color.theme.blue)
                            .matchedGeometryEffect(id: "tab_underline", in: namespace)
                    } else {
                        RoundedRectangle(cornerRadius: 5)
                            .frame(width: 50, height: 3)
                            .foregroundColor(.clear)
                    }
                }
                Spacer()
            }
            .font(.subheadline)
            .fontWeight(.semibold)
        }
        
    }
    // content
    @ViewBuilder
    private var content: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch currentTab {
            case .all:
                NotificationsListView(notifications: loggedInUser.allNotifications)
            case .verified:
                NotificationsListView(notifications: loggedInUser.verifiedNotifications)
            case .mentions:
                NotificationsListView(notifications: loggedInUser.verifiedNotifications)
            }
        }
    }
}
