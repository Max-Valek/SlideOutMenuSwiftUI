//
//  NewButton.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import SwiftUI

// Button on the bottom right of the screen (new tweet/message)
struct NewButtonView: View {
    
    let icon: String
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Image(systemName: icon)
                        .font(.title2)
                        .foregroundColor(Color.theme.text)
                        .padding(16)
                        .background(Color.theme.blue, in: Circle())
                }
            }
            .padding(.trailing)
            .padding(.bottom)
        }
    }
}

struct NewButtonView_Previews: PreviewProvider {
    static var previews: some View {
        NewButtonView(icon: "plus")
    }
}
