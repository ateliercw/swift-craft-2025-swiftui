//
//  RootView.swift
//  Layouts
//
//  Created by Michael Skiba on 13/05/2025.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Animations") {
                    AnimationsView()
                }
                NavigationLink("Reacting to scroll events") {
                    ScrollTransitionsView()
                }
                NavigationLink("Parallax scrolling") {
                    ParallaxScrollingView()
                }
            }
            .navigationTitle(Text("Interaction"))
            .listStyle(.grouped)
        }
    }
}

#Preview {
    RootView()
}
