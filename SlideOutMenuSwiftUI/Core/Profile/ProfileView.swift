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
