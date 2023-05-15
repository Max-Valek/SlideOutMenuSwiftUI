//
//  NewMessageView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct NewMessageView: View {
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.theme.black
                .ignoresSafeArea()
            
            VStack {
                header
                
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
