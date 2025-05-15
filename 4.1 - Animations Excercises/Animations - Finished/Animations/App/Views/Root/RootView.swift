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
                NavigationLink("Reacting to scroll events") {
                    ScrollingView()
                }
            }
            .navigationTitle(Text("Animations"))
            .listStyle(.grouped)
        }
    }
}

#Preview {
    RootView()
}
