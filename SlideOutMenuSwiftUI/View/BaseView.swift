//
//  BaseView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct BaseView: View {
    
    @State var showMenu: Bool = false
    
    var body: some View {
        
        // whole navigation view
        NavigationStack {
            
            HStack(spacing: 0) {
                // side menu
                SideMenu(showMenu: $showMenu)
            }
            // no nav title, hide nav bar
            .navigationBarTitleDisplayMode(.inline)
            // (this is deprecated, change later)
            .navigationBarHidden(true)
        }
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
