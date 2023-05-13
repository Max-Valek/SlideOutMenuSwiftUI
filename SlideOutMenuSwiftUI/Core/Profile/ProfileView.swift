//
//  ProfileView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct ProfileView: View {
    
    var user: User
    
    @Namespace private var namespace
    @State private var currentTab: ProfileTab = .tweets
    
    var body: some View {
        
        ZStack {
            
            Color.theme.black
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    // header photo
                    VStack {
                        Image(user.headerImage ?? "defaultHeader")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                    }
                    
                    // profile pic and edit profile button
                    HStack(alignment: .center) {
                        Image(user.profileImage ?? "default")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .padding(3)
                            .background(Color.theme.black, in: Circle())
                        
                        Spacer()
                        
                        Button {
                            // edit profile pressed
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .foregroundColor(Color.theme.text)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 12)
                                .background(Color.theme.black)
                                .clipShape(Capsule())
                                .padding(2)
                                .background(Color.theme.twitterBlack, in: Capsule())
                        }
                        .padding(.top, 24)
                    }
                    .padding(.horizontal)
                    
                    // display name and username
                    VStack(alignment: .leading, spacing: 4) {
                        // display name
                        HStack {
                            Text(user.displayName)
                                .font(.title3)
                                .fontWeight(.bold)
                            
                            if user.isVerified {
                                Image(systemName: "checkmark.seal.fill")
                                    .font(.subheadline)
                                    .foregroundColor(Color.theme.blue)
                            }
                        }
                        
                        Text("@\(user.username)")
                            .font(.subheadline)
                            .foregroundColor(Color.theme.lightGray)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    
                    // user bio
                    if let bio = user.bio {
                        HStack {
                            Text(bio)
                                .font(.subheadline)
                            
                            Spacer()
                        }
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    }
                    
                    // following, followers
                    HStack(spacing: 12) {
                        
                        HStack(spacing: 4) {
                            Text("\(user.following.count)")
                            
                            Text("Following")
                                .foregroundColor(Color.theme.lightGray)
                        }
                        
                        HStack(spacing: 4) {
                            Text("\(user.followers.count)")
                            
                            Text("Followers")
                                .foregroundColor(Color.theme.lightGray)
                        }
                        
                        Spacer()
                    }
                    .font(.subheadline)
                    .padding(.horizontal)
                    .padding(.bottom, 8)
                    
                    // tabs
                    //profileTabs
                    tabs
                    
                    Divider()
                    
                    Spacer()
                }
                
                
            }
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Text(user.displayName)
                
            }
            
        }
        .foregroundColor(Color.theme.text)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.doge)
    }
}

extension ProfileView {
    // tweets, replies, media, likes
    private var tabs: some View {
        HStack {
            Spacer()
            
            ForEach(ProfileTab.allCases) { tab in
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
}
