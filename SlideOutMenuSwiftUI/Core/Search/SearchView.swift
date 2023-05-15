//
//  SearchView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.dismiss) var dismiss
    
    // for testing
    let loggedInUser: User
    @Binding var showMenu: Bool
    @Namespace private var namespace
    
    @State private var currentTab: SearchTab = .forYou
    @State private var showExploreSettings: Bool = false
    @State private var searching: Bool = false
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea()
            
            if searching {
                VStack {
                    // searching header
                    searchingHeader
                    recentSearchesTitle
                    Spacer()
                }
                .foregroundColor(Color.theme.text)
            } else {
                // new tweet button
                NewButtonView(icon: "plus")
                .zIndex(2.0)
                
                VStack(spacing: 0) {
                    header
                    content
                    Spacer()
                }
                .foregroundColor(Color.theme.text)
            }
            
        }
        .fullScreenCover(isPresented: $showExploreSettings) {
            ExploreSettingsView(loggedInUser: loggedInUser)
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(loggedInUser: User.elon, showMenu: .constant(true))
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
                .onTapGesture {
                    searching.toggle()
                }
                
                // settings button
                Button {
                    withAnimation {
                        showExploreSettings.toggle()
                    }
                } label: {
                    Image(systemName: "gearshape")
                        .font(.title3)
                }
                
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
        ScrollView(.vertical, showsIndicators: false) {
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
    
    // when searching
    
    // search header
    private var searchingHeader: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.theme.lightGray)
                TextField("Search Twitter", text: $searchText)
                    .foregroundColor(Color.theme.lightGray)
                Spacer(minLength: 0)
            }
            .tint(Color.theme.lightGray)
            .padding(8)
            .background(Color.theme.twitterBlack, in: Capsule())
            
            Button("Cancel") {
                searching.toggle()
                dismiss()
            }
            .tint(Color.theme.text)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    // recent searches
    private var recentSearchesTitle: some View {
        HStack {
            Text("Recent Searches")
                .font(.headline)
            
            Spacer()
            
            Text("X")
                .font(.subheadline)
                .padding(8)
                .background(Color.theme.twitterBlack, in: Circle())
        }
        .padding(.horizontal)
        .padding(.vertical)
    }
}
