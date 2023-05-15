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
    
    var body: some View {
        
        ZStack {
            
            Color.theme.black
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                header
                
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
                
                // twitter logo
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
                HStack {
                    ForEach(SearchTab.allCases, id: \.self) { tab in
                        Text(tab.title)
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(Color.theme.lightGray)
                            .padding(.horizontal)
                    }
                }
            }
            
            Divider()
                .frame(height: 0.75)
                .overlay(Color.theme.darkGray.opacity(0.4))
                .padding(0)
        }
        .padding(0)
        .background(Color.theme.white.opacity(0.025))
    }

}
