//
//  SearchView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct SearchView: View {
    
    // for testing
    let loggedInUser: User
    
    @Binding var showMenu: Bool
    @Namespace private var namespace
    @State private var currentTab: SearchTab = .forYou
    
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

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(loggedInUser: User.elon, showMenu: .constant(false))
    }
}

extension SearchView {
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
                
                // search bar
                HStack {
                    Image(systemName: "magnifyingglass")
                    Text("Search Twitter")
                }
                .foregroundColor(Color.theme.lightGray)
                .padding(.vertical, 8)
                .frame(maxWidth: .infinity)
                .background(Color.theme.twitterBlack, in: Capsule())
                
                // settings button
                Image(systemName: "gearshape")
                    .font(.title3)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 24) {
                    tabs
                }
                .padding(.horizontal)
                .padding(.top, 8)
            }
            
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

            ForEach(SearchTab.allCases, id: \.self) { tab in
                VStack {
                    Text(tab.title)
                        .foregroundColor(currentTab == tab ? Color.theme.text : Color.theme.darkGray)
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
            }
            .font(.subheadline)
            .fontWeight(.bold)
    }

    // content
    @ViewBuilder
    private var content: some View {
        switch currentTab {
        case .forYou:
            Text("For You")
        case .trending:
            Text("Trending")
        case .news:
            Text("News")
        case .sports:
            Text("Sports")
        case .entertainment:
            Text("Entertainment")
        }
    }
}
