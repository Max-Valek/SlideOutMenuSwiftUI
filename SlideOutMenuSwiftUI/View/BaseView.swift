//
//  BaseView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI

struct BaseView: View {
    
    @State var showMenu: Bool = false
    
    // hiding native tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab = "house"
    
    // offset for both drag gesture and showing menu
    @State var offset: CGFloat = 0
    @State var lastStoredOffset: CGFloat = 0
    
    // gesture offset
    @GestureState var gestureOffset: CGFloat = 0
    
    var body: some View {
        
        let sidebarWidth = getRect().width - 90
        
        // whole navigation view
        NavigationStack {
            
            HStack(spacing: 0) {
                
                // side menu
                SideMenu(showMenu: $showMenu)
                
                // main tab view
                VStack(spacing: 0) {
                    
                    TabView(selection: $currentTab) {
                        
                        HomeView(showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("house")
                        
                        Text("Search")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("magnifyingglass")
                        
                        Text("Notifications")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("bell")
                        
                        Text("Messages")
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag("envelope")
                    }
                    
                    // custom tab bar
                    VStack(spacing: 0) {
                        
                        Divider()
                        
                        HStack(spacing: 0) {
                            
                            // tab buttons
                            TabButton(image: "house")
                            
                            TabButton(image: "magnifyingglass")
                            
                            TabButton(image: "bell")
                            
                            TabButton(image: "envelope")
                        }
                        .padding(.top, 15)
                    }
                    
                }
                .frame(width: getRect().width)
                // background when menu is showing
                .overlay(
                    Rectangle()
                        // shade over main view when sidebar is showing
                        .fill(
                            Color.primary
                                .opacity(Double((offset / sidebarWidth) / 5))
                        )
                        // ignore tab bar, etc
                        .ignoresSafeArea(.container, edges: .vertical)
                        // toggle showMenu when outside of menu is pressed
                        .onTapGesture {
                            withAnimation {
                                showMenu.toggle()
                            }
                        }
                )
            }
            // max size
            .frame(width: getRect().width + sidebarWidth)
            .offset(x: -sidebarWidth / 2)
            .offset(x: offset > 0 ? offset : 0)
            // drag gesture
            .gesture(
                DragGesture()
                    .updating($gestureOffset, body: { value, out, _ in
                        out = value.translation.width
                    })
                    .onEnded(onEnd(value:))
            )
            // no nav title, hide nav bar
            .navigationBarTitleDisplayMode(.inline)
            // (this is deprecated, change later)
            .navigationBarHidden(true)
        }
        .animation(.easeOut, value: offset == 0)
        .onChange(of: showMenu) { newValue in
            
            if showMenu && offset == 0 {
                offset = sidebarWidth
                lastStoredOffset = offset
            }
            
            if !showMenu && offset == sidebarWidth {
                offset = 0
                lastStoredOffset = 0
            }
        }
        .onChange(of: gestureOffset) { newValue in
            onChange()
        }
    }
    
    func onChange() {
        let sidebarWidth = getRect().width - 90
        
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sidebarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    
    // called when drag gesture ends
    func onEnd(value: DragGesture.Value) {
        
        let sidebarWidth = getRect().width - 90
        
        let translation = value.translation.width
        
        withAnimation {
            
            if translation > 0 {
                // show menu if dragged over halfway
                if translation > (sidebarWidth / 2) {
                    offset = sidebarWidth
                    showMenu = true
                } else {
                    
                    // so you cant drag past end of sidebar
                    if offset == sidebarWidth {
                        return
                    }
                    
                    offset = 0
                    showMenu = false
                }
            } else {
                // dismiss menu if dragged over halfway
                if -translation > (sidebarWidth / 2) {
                    offset = 0
                    showMenu = false
                } else {
                    
                    if offset == 0 || !showMenu {
                        return
                    }
                    
                    offset = sidebarWidth
                    showMenu = true
                }
            }
        }
        
        // store last offset
        lastStoredOffset = offset
    }
    
    @ViewBuilder
    func TabButton(image: String) -> some View {
        Button {
            withAnimation {
                currentTab = image
            }
        } label: {
            Image(systemName: image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 22)
                .foregroundColor(currentTab == image ? .primary : .gray)
                .frame(maxWidth: .infinity)
        }

    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
