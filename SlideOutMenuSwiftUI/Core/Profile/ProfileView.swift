//
//  ProfileView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct ProfileView: View {
    
    var user: User
    
    var body: some View {
        
        ZStack {
            
            Color.theme.black
                .ignoresSafeArea()
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    
                    // header photo
                    VStack {
                        Image(user.headerImage ?? "defaultHeader")
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity)
                            .frame(height: 100)
                    }
                    
                    HStack(alignment: .center) {
                        Image(user.profileImage ?? "default")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                            .padding(3)
                            .background(Color.theme.black, in: Circle())
                        
                        Spacer()
                        
                        Button {
                            // edit profile pressed
                        } label: {
                            Text("Edit Profile")
                                .font(.subheadline)
                                .foregroundColor(Color.theme.text)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 12)
                                .background(Color.theme.black)
                                .clipShape(Capsule())
                                .padding(1)
                                .background(Color.theme.darkGray, in: Capsule())
                        }
                        .padding(.top, 24)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
            }
            .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                Text(user.displayName)
                
            }
            .foregroundColor(Color.theme.text)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User.elon)
    }
}
