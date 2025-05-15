//
//  ScrollingView.swift
//  Layouts
//
//  Created by Michael Skiba on 14/05/2025.
//

import SwiftUI

struct ScrollingView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(1..<5) { section in
                    VStack(alignment: .leading) {
                        ScrollTrackingView()
                        ForEach(0..<10) { index in
                            Text("This is item \(index + 1)")
                        }
                    }
                }
            }
            .navigationTitle("Scrolling")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

private struct ScrollTrackingView: View {
    @State private var offset: CGFloat?

    var body: some View {
        Rectangle()
            .frame(height: 120)
            .padding(.horizontal, -10)
            .foregroundStyle(.gray.secondary.shadow(.inner(radius: 10)))
            .overlay(alignment: .leading) {
                Rectangle()
                    .frame(width: 2)
                    .offset(x: offset ?? 0)
            }
            .onGeometryChange(for: CGFloat?.self) { geometry in
                guard var height = geometry.bounds(of: .scrollView)?.size.height else { return nil }
                let insets = geometry.safeAreaInsets
                height -= insets.top + insets.bottom
                let offset = geometry.frame(in: .scrollView).minY
                let width = geometry.size.width
                return width - (width * ((height - offset) / height))
            } action: { update in
                offset = update
            }
            .scrollTransition(.interactive) { effect, phase in
                if phase != .identity{
                    effect.opacity(0)
                } else {
                    effect.opacity(1)
                }
            }
    }
}

#Preview {
    NavigationStack {
        ScrollingView()
    }
}
