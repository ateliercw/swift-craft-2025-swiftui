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
                Section("Container") {
                    NavigationLink("Layouts") {
                        LayoutsView()
                    }
                    NavigationLink("Boxes") {
                        BoxesView()
                    }
                }
                NavigationLink("Scrolling") {
                    Text("Scrolling")
                }
                NavigationLink("Adaptive layout") {
                    Text("Fitting")
                }
            }
            .navigationTitle(Text("Layouts"))
            .listStyle(.grouped)
        }
    }
}

#Preview {
    RootView()
}
