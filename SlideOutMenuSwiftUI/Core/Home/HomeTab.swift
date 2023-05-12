//
//  HomeTab.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/12/23.
//

import Foundation

enum HomeTab: CaseIterable {
    case forYou, following
}

extension HomeTab {
    
    var title: String {
        switch self {
        case .forYou:
            return "For You"
        case .following:
            return "Following"
        }
    }
}
