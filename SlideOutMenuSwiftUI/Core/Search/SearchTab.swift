//
//  SearchTab.swift
//  SlideOutMenuSwiftUI
//
//  Created by Max Valek on 5/15/23.
//

import Foundation

// enum for search view tabs

enum SearchTab: CaseIterable {
    case forYou, trending, news, sports, entertainment
}

extension SearchTab {
    var title: String {
        switch self {
        case .forYou:
            return "For You"
        case .trending:
            return "Trending"
        case .news:
            return "News"
        case .sports:
            return "Sports"
        case .entertainment:
            return "Entertainment"
        }
    }
}
