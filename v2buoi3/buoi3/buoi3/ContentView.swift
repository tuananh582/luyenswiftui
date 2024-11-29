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
            FetchView(show: Constants.bbName)
               // .toolbarBackgroundVisibility(.visible, for: .tabBar)
                .tabItem {
                Label(Constants.bbName, systemImage: "tortoise")
            }
            FetchView(show: Constants.bcsName)
                //.toolbarBackgroundVisibility(.visible, for: .tabBar)
                .tabItem {
                Label(Constants.bcsName, systemImage: "briefcase")
            }
            FetchView(show: Constants.ecName)
                //.toolbarBackgroundVisibility(.visible, for: .tabBar)
                .tabItem {
                Label(Constants.ecName, systemImage: "car")
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
