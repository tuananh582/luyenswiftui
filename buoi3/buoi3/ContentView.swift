//
//  ContentView.swift
//  buoi3
//
//  Created by TuanAnh on 20/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            QuoteView(show: "Breaking Bad")
               // .toolbarBackgroundVisibility(.visible, for: .tabBar)
                .tabItem {
                Label("Breaking Bad", systemImage: "tortoise")
            }
            QuoteView(show: "Better Call Saul")
                //.toolbarBackgroundVisibility(.visible, for: .tabBar)
                .tabItem {
                Label("Better Call Saul", systemImage: "briefcase")
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
