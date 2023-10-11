//
//  MainTabView.swift
//  TwitterApp
//
//  Created by Volkan Celik on 24/08/2023.
//

import SwiftUI

struct MainTabView: View {
    
    @Binding var selectedIndex:Int
    var body: some View {
        TabView(selection: $selectedIndex) {
            FeedView()
                .onTapGesture {
                    selectedIndex=0
                }
                .tabItem {
                    Image(systemName: "house")
                }.tag(0)
            SearchView()
                .onTapGesture {
                    selectedIndex=1
                }
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }.tag(1)
            ConversationsView()
                .onTapGesture {
                    selectedIndex=2
                }
                .tabItem {
                    Image(systemName: "envelope")
                }.tag(2)
        }
    }
}


