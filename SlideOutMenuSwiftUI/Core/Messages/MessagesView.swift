//
//  MessagesView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct MessagesView: View {
    
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

struct MessagesView_Previews: PreviewProvider {
    static var previews: some View {
        MessagesView(loggedInUser: User.elon, showMenu: .constant(false))
    }
}

extension MessagesView {
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
                
                Spacer()
                
                // twitter logo
                HStack {
                    Text("Messages")
                        .font(.headline)
                }
                
                Spacer()
                
                // settings button
                Image(systemName: "gearshape")
                    .font(.title3)
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            HStack {
                Image(systemName: "magnifyingglass")
                Text("Search Direct Messages")
            }
            .foregroundColor(Color.theme.lightGray)
            .padding(.vertical, 8)
            .frame(maxWidth: .infinity)
            .background(Color.theme.twitterBlack, in: Capsule())
            .padding(.horizontal)
            .padding(.vertical, 10)
            
            Divider()
                .frame(height: 0.75)
                .overlay(Color.theme.darkGray.opacity(0.4))
                .padding(0)
        }
        .padding(0)
        .background(Color.theme.white.opacity(0.025))
    }

}
