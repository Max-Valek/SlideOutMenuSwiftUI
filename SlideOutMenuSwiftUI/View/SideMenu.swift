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
            VStack(alignment: .leading, spacing: 14) {
                
                Image("elon")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                Text("Elon Musk")
                    .font(.title2)
                    .fontWeight(.bold)
                
                Text("@ElonMusk")
                    .font(.callout)
                
                // followers/following
                HStack(spacing: 12) {
                    Button {
                        
                    } label: {
                        Label {
                            Text("Following")
                        } icon: {
                            Text("189")
                                .fontWeight(.bold)
                        }
                    }
                    
                    Button {
                        
                    } label: {
                        Label {
                            Text("Followers")
                        } icon: {
                            Text("1.2M")
                                .fontWeight(.bold)
                        }
                    }
                }
                .foregroundColor(.primary)
            }
            .padding(.horizontal)
            .padding(.leading)
            .padding(.bottom)
            
            // sidebar tab buttons
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack {
                    
                    // profile, lists, topics, ...
                    VStack(alignment: .leading, spacing: 45) {
                        
                        TabButton(title: "Profile", image: "person")
                        TabButton(title: "Lists", image: "list.bullet.rectangle")
                        TabButton(title: "Topics", image: "text.bubble.rtl")
                        TabButton(title: "Bookmarks", image: "bookmark")
                        TabButton(title: "Moments", image: "bolt")
                        TabButton(title: "Purchases", image: "cart")
                        TabButton(title: "Monetization", image: "dollarsign.square")
                    }
                    .padding()
                    .padding(.leading)
                    .padding(.top, 35)
                    
                    Divider()
                    
                    TabButton(title: "Twitter Ads", image: "arrow.up.right.square")
                        .padding()
                        .padding(.leading)
                    
                    Divider()
                    
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
                    .foregroundColor(.primary)
                }
            }
            
            // light bulb, qr code
            VStack(spacing: 0) {
                Divider()
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "lightbulb")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 14, height: 14)
                    }
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "qrcode")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 17, height: 17)
                    }
                }
                .padding([.horizontal, .top], 15)
                .foregroundColor(.primary)
            }
            
        }
        .padding(.top)
        .frame(maxWidth: .infinity, alignment: .leading)
        // use view extension
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.primary
                .opacity(0.04)
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
            HStack(spacing: 12) {
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 17, height: 17)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
        }


    }
}

struct SideMenu_Previews: PreviewProvider {
    static var previews: some View {
        SideMenu(showMenu: .constant(false))
    }
}

// extend view to get screen rect
extension View {
    
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
