//
//  HomeView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct HomeView: View {
    
    // for testing
    let loggedInUser: User
    @Binding var showMenu: Bool
    @Namespace private var namespace
    @State private var currentTab: HomeTab = .forYou
    
    var body: some View {
        
        ZStack {
            Color.theme.black
                .ignoresSafeArea()
            
            // new tweet button
            NewButtonView(icon: "plus")
            .zIndex(2.0)
            
            VStack(spacing: 0) {
                // header
                header
                // tweets
                content
                Spacer()
            }
            .foregroundColor(Color.theme.text)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(loggedInUser: User.elon, showMenu: .constant(false))
    }
}

extension HomeView {
    // header
    private var header: some View {
        VStack(spacing: 0) {
            // profile pic, twitter logo
            HStack {
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
                Image("twitter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
                
                Spacer()
                
                // invisible image for formatting
                Image("default")
                    .resizable()
                    //.aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    //.clipShape(Circle())
                    .opacity(0)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            // for you / following tabs
            topTabs
            
            Divider()
                .frame(height: 0.75)
                .overlay(Color.theme.darkGray.opacity(0.4))
                .padding(0)
        }
        .padding(0)
        .background(Color.theme.white.opacity(0.025))
    }
    // header tabs
    private var topTabs: some View {
        HStack {
            Spacer()
            VStack {
                Text("For You")
                    .foregroundColor(currentTab == .forYou ? Color.theme.text : Color.theme.lightGray)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            currentTab = .forYou
                        }
                    }
                // tab underline
                if currentTab == .forYou {
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
            VStack {
                Text("Following")
                    .foregroundColor(currentTab == .following ? Color.theme.text : Color.theme.lightGray)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            currentTab = .following
                        }
                }
                // tab underline
                if currentTab == .following {
                    RoundedRectangle(cornerRadius: 5)
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
        .padding(.bottom, 3)
    }
    // tweets
    private var content: some View {
        ScrollView(.vertical, showsIndicators: false) {
            switch currentTab {
            case .forYou:
                VStack {
                    Spacer()
                    TweetListView(tweetList: Tweet.sampleForYou)
                    Spacer()
                }
                //.frame(width: getRect().width, height: getRect().height)
                .frame(maxWidth: .infinity)
                .transition(.move(edge: .leading))
                    
            case .following:
                VStack {
                    Spacer()
                    TweetListView(tweetList: Tweet.sampleFollowing)
                    Spacer()
                }
                //.frame(width: getRect().width, height: getRect().height)
                .frame(maxWidth: .infinity)
                .transition(.move(edge: .trailing))
            }
        }
    }
}
