//
//  NewTweetView.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

struct NewTweetView: View {
    
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

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}

extension NewTweetView {
    // header
    private var header: some View {
        HStack {
            Button("Cancel") {
                dismiss()
            }
            Spacer()
            Button {
                //
            } label: {
                Text("Tweet")
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(Color.theme.blue, in: Capsule())
            }
            .disabled(true)

        }
        .padding(.horizontal)
        .padding(.vertical, 8)
        .background(Color.theme.text.opacity(0.025))
    }
}
