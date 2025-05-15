
//
//  ScrollTransitionsView.swift
//  Layouts
//
//  Created by Michael Skiba on 14/05/2025.
//

import SwiftUI

struct ScrollTransitionsView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(1..<10) { section in
                    ScrollHeaderView(label: "Section \(section)")
                    VStack(alignment: .leading) {
                        ForEach(0..<10) { index in
                            Text("This is item \(index + 1)")
                        }
                    }
                }
            }
            .padding()
            .navigationTitle("Scroll Transitions")
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .safeAreaInset(edge: .top) {
            Rectangle().stroke(.red).frame(height: 40)
        }
    }
}

private struct ScrollHeaderView: View {
    let label: LocalizedStringKey

    var body: some View {
        Text(label)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title).fontWeight(.bold)
            .fontDesign(.serif)
            .scrollTransition(.interactive) { effect, phase  in
                effect
            }
    }
}

#Preview {
    NavigationStack {
        ScrollTransitionsView()
    }
}
