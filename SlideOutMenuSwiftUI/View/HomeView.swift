//
//  HomeView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct HomeView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        
        VStack {
            
            // profile image, timeline button
            VStack(spacing: 0) {
                
                HStack {
                    
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
                    
                    NavigationLink {
                        Text("Timeline View")
                    } label: {
                        Image(systemName: "sparkles")
                            .font(.title)
                            .foregroundColor(.primary)
                            //.resizable()
                            //.aspectRatio(contentMode: .fit)
                            //.frame(width: 30, height: 30)
                            //.clipShape(Circle())
                    }

                }
                .padding(.horizontal)
                .padding(.vertical, 10)
                
                Divider()
            }
            // overlay the twitter logo
            .overlay(
                Image("twitter")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 35, height: 35)
            )
            
            Spacer()
        }

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(showMenu: .constant(false))
    }
}
