//
//  SideMenu.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct SideMenu: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            // pic, name, username, followers, following
            VStack(alignment: .leading, spacing: 2) {
                
                Image("elon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .padding(.bottom, 8)
                
                Text("Elon Musk")
                    .font(.title3)
                    .fontWeight(.bold)
                
                Text("@ElonMusk")
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
                            Text("189")
                                .fontWeight(.bold)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text("Followers")
                                .foregroundColor(Color.theme.lightGray)
                        } icon: {
                            Text("1.2M")
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
                        .frame(height: 0.75)
                        .overlay(Color.theme.lightGray.opacity(0.4))
                    
                    TabButton(title: "Twitter Ads", image: "arrow.up.right.square")
                        .padding()
                        .padding(.leading)
                    
                    Divider()
                        .frame(height: 0.75)
                        .overlay(Color.theme.lightGray.opacity(0.4))
                    
                    // settings and privacy, help center
                    VStack(alignment: .leading, spacing: 30) {
                        
                        HStack {
                            Button("Settings And Privacy") {
                                
                            }
                            Spacer()
                        }
                        
                        Button("Help Center") {
                            
                        }
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.bottom)
                    .foregroundColor(Color.theme.text)
                }
            }
            
            // moon button (changing color mode)
            VStack(spacing: 0) {
                Divider()
                    .frame(height: 0.75)
                    .overlay(Color.theme.lightGray.opacity(0.4))
                
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
            
            Text("\(title) View")
                .navigationTitle(title)
            
        } label: {
            HStack(alignment: .center, spacing: 16) {
                Image(systemName: image)
                    //.imageScale(.large)
                    .resizable()
                    //.renderingMode(.template)
                    //.aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
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
        SideMenu(showMenu: .constant(true))
    }
}

// extend view to get screen rect
extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
