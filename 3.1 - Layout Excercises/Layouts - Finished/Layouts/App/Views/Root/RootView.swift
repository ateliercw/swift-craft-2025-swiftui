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
                NavigationLink("Layouts") {
                    LayoutsView()
                }
                NavigationLink("Boxes") {
                    BoxesView()
                }
                NavigationLink("Layout guides") {
                    AlignmentGuidesView()
                }
                NavigationLink("Adaptive layout") {
                    ViewThatFitsView()
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
