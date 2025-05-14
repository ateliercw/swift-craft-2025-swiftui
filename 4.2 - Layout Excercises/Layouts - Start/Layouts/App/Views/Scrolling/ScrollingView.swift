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
            // This is inline because otherwise as the text scrolls, the scroll view frame changes and the progress stalls
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
    }
}

#Preview {
    NavigationStack {
        ScrollingView()
    }
}
