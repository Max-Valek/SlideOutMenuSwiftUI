//
//  HomeView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showMenu: Bool
    @Namespace private var namespace
    @State private var currentTab: HomeTab = .forYou
    
    var body: some View {
        
        ZStack {
            
            Color.theme.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // header
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
                            Image("elon")
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
                        Image("elon")
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
                .background(Color.theme.white.opacity(0.05))
                
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
        HomeView(showMenu: .constant(false))
    }
}

extension HomeView {
    
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
                        .frame(width: 50, height: 2)
                        .foregroundColor(Color.theme.blue)
                        .matchedGeometryEffect(id: "tab_underline", in: namespace)
                } else {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 2)
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
                        .frame(width: 50, height: 2)
                        .foregroundColor(Color.theme.blue)
                        .matchedGeometryEffect(id: "tab_underline", in: namespace)
                } else {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 2)
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
                Text("For You")
                    //.frame(width: getRect().width, height: getRect().height)
                    .frame(maxWidth: .infinity)
                    .transition(.move(edge: .leading))
            case .following:
                Text("Following")
                    .frame(width: getRect().width, height: getRect().height)
                    .transition(.move(edge: .trailing))
            }
        }
    }
}