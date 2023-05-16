//
//  NewMessageView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct NewMessageView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var searchText: String = ""
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea()
            
            VStack {
                header
                Divider()
                
                HStack {
                    Text("To:")
                    
                    TextField("", text: $searchText)
                }
                .padding(.horizontal)
                
                ScrollView(.vertical) {
                    // create group row
                    HStack {
                        HStack {
                            Image(systemName: "person.2")
                                .font(.system(size: 18))
                                .foregroundColor(Color.theme.blue)
                        }
                        .frame(width: 20, height: 20)
                        .padding(8)
                        .background(Color.theme.black, in: Circle())
                        .padding(1)
                        .background(Color.theme.blue, in: Circle())
                        
                        Text("Create a group")
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .foregroundColor(Color.theme.blue)
                        
                        Spacer()
                    }
                    
                    ForEach(User.sampleUsers) { user in
                        HStack {
                            // profile pic
                            HStack {
                                Image(user.profileImage ?? "default")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 38, height: 38)
                                    .clipShape(Circle())
                            }
                            
                            VStack(alignment: .leading) {
                                Text(user.displayName)
                                    .font(.subheadline)
                                    .fontWeight(.bold)
                                Text("@\(user.username)")
                                    .font(.caption)
                                    .foregroundColor(Color.theme.lightGray)
                            }
                            
                            Spacer()
                        }
                    }
                    
                }
                .padding(.horizontal)
                
                Divider()
                
                Spacer()
            }
        }
        .foregroundColor(Color.theme.text)
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}

extension NewMessageView {
    // header
    private var header: some View {
        HStack {
            Button("Cancel") {
                dismiss()
            }
            Spacer()
            
            Text("New Message")
            
            Spacer()

            Button("Cancel") {
                
            }
            .opacity(0)
            
        }
        .padding(.horizontal)
        .padding(.vertical)
        .background(Color.theme.text.opacity(0.025))
    }
}
