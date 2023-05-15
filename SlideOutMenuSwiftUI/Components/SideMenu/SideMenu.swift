//
//  SideMenu.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct SideMenu: View {
    
    let loggedInUser: User
    @Binding var showMenu: Bool
    @State private var showProfessionalTools: Bool = false
    @State private var showSettingsAndSupport: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            // pic, name, username, followers, following
            VStack(alignment: .leading, spacing: 2) {
                
                Image(loggedInUser.profileImage ?? "default")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.bottom, 8)
                
                Text(loggedInUser.displayName)
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("@\(loggedInUser.username)")
                    .font(.callout)
                    .foregroundColor(Color.theme.lightGray)
                
                // followers/following
                HStack(spacing: 14) {
                    Button {
                        
                    } label: {
                        Label {
                            Text("Following")
                                .foregroundColor(Color.theme.lightGray)
                        } icon: {
                            Text("\(loggedInUser.following.count)")
                                .fontWeight(.bold)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text("Followers")
                                .foregroundColor(Color.theme.lightGray)
                        } icon: {
                            Text("\(loggedInUser.followers.count)")
                                .fontWeight(.bold)
                        }
                    }
                }
                .font(.subheadline)
                .padding(.top)
            }
            .foregroundColor(Color.theme.text)
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            
            // sidebar tab buttons
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    // profile, lists, topics, ...
                    VStack(alignment: .leading, spacing: 25) {
                        
                        TabButton(title: "Profile", image: "person")
                        TabButton(title: "Topics", image: "text.bubble.rtl")
                        TabButton(title: "Bookmarks", image: "bookmark")
                        TabButton(title: "Lists", image: "list.bullet.rectangle")
                        TabButton(title: "Twitter Circle", image: "person.2.circle")
                        TabButton(title: "Follower Requests", image: "person.badge.plus")
                    }
                    .padding()
                    .padding(.leading)
                    //.padding(.top)
                    
                    Divider()
                    
                    VStack(spacing: 20) {
                        HStack {
                            Text("Professional Tools")
                            Spacer()
                            Image(systemName: "chevron.down")
                                .rotationEffect(showProfessionalTools ? Angle(degrees: 180) : Angle(degrees: 0))
                                .foregroundColor(showProfessionalTools ? Color.theme.blue : Color.theme.text)
                        }
                        .onTapGesture {
                            withAnimation {
                                showProfessionalTools.toggle()
                            }
                        }
                        
                        if showProfessionalTools {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(spacing: 16) {
                                    Image(systemName: "arrow.up.forward")
                                    Text("Twitter for Professionals")
                                    Spacer()
                                }
                                HStack(spacing: 16) {
                                    Image(systemName: "arrow.up.forward.square")
                                    Text("Twitter Ads")
                                    Spacer()
                                }
                                HStack(spacing: 16) {
                                    Image(systemName: "coloncurrencysign.square")
                                    Text("Monetization")
                                    Spacer()
                                }
                            }
                        }
                        
                        HStack {
                            Text("Settings and Support")
                            Spacer()
                            Image(systemName: "chevron.down")
                                .rotationEffect(showSettingsAndSupport ? Angle(degrees: 180) : Angle(degrees: 0))
                                .foregroundColor(showSettingsAndSupport ? Color.theme.blue : Color.theme.text)
                        }
                        .onTapGesture {
                            withAnimation {
                                showSettingsAndSupport.toggle()
                            }
                        }
                        
                        if showSettingsAndSupport {
                            VStack(alignment: .leading, spacing: 8) {
                                HStack(spacing: 16) {
                                    Image(systemName: "gearshape")
                                    Text("Settings and privacy")
                                    Spacer()
                                }
                                HStack(spacing: 16) {
                                    Image(systemName: "questionmark.circle")
                                    Text("Help Center")
                                    Spacer()
                                }
                                HStack(spacing: 16) {
                                    Image(systemName: "cart")
                                    Text("Purchases")
                                    Spacer()
                                }
                            }
                        }
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.theme.text)
                    .padding()
                    .padding(.horizontal)
                }
            }
            
            // moon button (changing color mode)
            VStack(spacing: 0) {
                Divider()
                    .frame(height: 0.75)
                    .overlay(Color.theme.darkGray.opacity(0.4))
                
                HStack {
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "moon.stars")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 22, height: 22)
                    }
                    
                    Spacer()
                }
                .padding([.horizontal, .top], 15)
                .padding(.leading)
                .foregroundColor(Color.theme.text)
            }
            
        }
        .padding(.top)
        .frame(maxWidth: .infinity, alignment: .leading)
        // use view extension
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.theme.black
                //.opacity(0.04)
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String) -> some View {
        
        // for navigation
        // simple replace button with navigation links
        
        NavigationLink {
            
//            Text("\(title) View")
//                .navigationTitle(title)
            if title == "Profile" {
                ProfileView(loggedInUser: loggedInUser, user: loggedInUser)
            }
            
        } label: {
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: image)
                    //.imageScale(.large)
                    .resizable()
                    //.renderingMode(.template)
                    //.aspectRatio(contentMode: .fill)
                    .frame(width: 20, height: 20)
                
                Text(title)
                    .fontWeight(.semibold)
            }
            .foregroundColor(Color.theme.text)
            //.fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
        }


    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(loggedInUser: User.elon, showMenu: .constant(true))
    }
}

// extend view to get screen rect
extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
