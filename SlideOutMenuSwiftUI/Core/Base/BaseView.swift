//
//  BaseView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import SwiftUI


// MARK: - View

struct BaseView: View {
    // for testing
    var loggedInUser: User = User.elon
    
    // whether to show side menu
    @State var showMenu: Bool = false
    
    // hiding native tab bar
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    @State var currentTab: BaseTab = .messages
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
                SideMenu(loggedInUser: loggedInUser, showMenu: $showMenu)
                
                // main tab view
                VStack(spacing: 0) {
                    
                    // tabs
                    TabView(selection: $currentTab) {
                        
                        HomeView(loggedInUser: loggedInUser, showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag(BaseTab.home)
                        
                        SearchView(loggedInUser: loggedInUser, showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag(BaseTab.search)
                        
                        NotificationsView(loggedInUser: loggedInUser, showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag(BaseTab.notifications)
                        
                        MessagesView(loggedInUser: loggedInUser, showMenu: $showMenu)
                            .navigationBarTitleDisplayMode(.inline)
                            .navigationBarHidden(true)
                            .tag(BaseTab.messages)
                    }
                    
                    // custom tab bar
                    VStack(spacing: 0) {
                        
                        Divider()
                            .frame(height: 0.75)
                            .overlay(Color.theme.darkGray.opacity(0.4))
                        
                        // custom tab buttons
                        HStack(spacing: 0) {
                            
                            // tab buttons
                            TabButton(tab: BaseTab.home)
                            
                            TabButton(tab: BaseTab.search)
                            
                            TabButton(tab: BaseTab.notifications)
                            
                            TabButton(tab: BaseTab.messages)
                        }
                        .padding(.top, 15)
                    }
                    
                }
                // Tab View VStack modifiers
                .frame(width: getRect().width)
                // background when menu is showing
                .overlay(
                    Rectangle()
                        // shade over main view when sidebar is showing
                        .fill(
                            Color.theme.text
                                .opacity(Double((offset / sidebarWidth) / 10))
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
            // max size (width of view + additional width for sidebar
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
            .background(Color.theme.black.opacity(0.975).ignoresSafeArea())
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
        
        /*
         set offset to:
         
         - gesture offset + last stored offset if added up theyre smaller than sidebar width
         - itself otherwise
         */
        offset = (gestureOffset != 0) ? (gestureOffset + lastStoredOffset < sidebarWidth ? gestureOffset + lastStoredOffset : offset) : offset
    }
    
    // called when drag gesture ends
    func onEnd(value: DragGesture.Value) {
        // width of sidebar
        let sidebarWidth = getRect().width - 90
        // horizontal distance of the drage gesture
        let translation = value.translation.width
        
        withAnimation {
            // pos when sliding to show menu
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
    
    // bottom tab button
    @ViewBuilder
    func TabButton(tab: BaseTab) -> some View {
        Button {
            withAnimation {
                currentTab = tab
            }
        } label: {
            Image(systemName: tab.image)
                .resizable()
                .renderingMode(.template)
                .aspectRatio(contentMode: .fit)
                .frame(width: 22, height: 22)
                .foregroundColor(currentTab == tab ? Color.theme.text : Color.theme.lightGray)
                .frame(maxWidth: .infinity)
        }

    }
}

// MARK: - Preview

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}
