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
            
            VStack(spacing: 0) {
                
                VStack {
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
                }
                
                
                ScrollView(.vertical, showsIndicators: false) {
                    switch currentTab {
                    case .forYou:
                        Text("For You")
                            .frame(width: getRect().width, height: getRect().height)
                            .transition(.move(edge: .leading))
                    case .following:
                        Text("Following")
                            .frame(width: getRect().width, height: getRect().height)
                            .transition(.move(edge: .trailing))
                    }
                }
                
                Spacer()
            }
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
                    .foregroundColor(currentTab == .forYou ? .primary : .gray)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            currentTab = .forYou
                        }
                    }
                // tab underline
                if currentTab == .forYou {
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .frame(width: 50, height: 2)
                        .foregroundColor(.primary)
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
                    .foregroundColor(currentTab == .following ? .primary : .gray)
                    .onTapGesture {
                        withAnimation(.easeIn(duration: 0.25)) {
                            currentTab = .following
                        }
                }
                // tab underline
                if currentTab == .following {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 50, height: 2)
                        .foregroundColor(.primary)
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
}
