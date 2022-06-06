//
//  BotNav.swift
//  amad-afl4-keeb-wiki
//
//  Created by Reynaldi Kindarto on 06/06/22.
//

import SwiftUI

struct BotNav: View {
    @State private var selectedTab = 1
        
        var body: some View {
            TabView(selection: $selectedTab) {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .tag(1)
            FavoriteView()
                .tabItem {
                    Label("Favorite", systemImage: "heart.fill")
                }
                .tag(2)
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
                .tag(3)
        }
    }
}

struct BotNav_Previews: PreviewProvider {
    static var previews: some View {
        BotNav()
    }
}
