//
//  ViewThatFitsLines.swift
//  Layouts
//
//  Created by Michael Skiba on 14/05/2025.
//

import SwiftUI

struct ViewThatFitsLines: View {
    let texts = [
        "All Systems Red, by Martha Wells",
        "The Murderbot Diaries, Book 1\nPublished in 2017",
        "I could have become a mass murderer after I hacked my governor module, but then I realized I could access the combined feed of entertainment channels carried on the company satellites. It had been well over 35,000 hours or so since then, with still not much murdering, but probably, I don’t know, a little under 35,000 hours of movies, serials, books, plays, and music consumed. As a heartless killing machine, I was a terrible failure."
    ]
    var body: some View {
        List {
            ForEach(1..<4) { limit in
                Section("\(limit) lines") {
                    VStack(alignment: .leading, spacing: 16) {
                        ForEach(texts, id: \.self) { text in
                            TextFittingView(text: text, lineLimit: limit)
                        }
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationTitle("View that Fits")
    }
}

private struct TextFittingView: View {
    var text: String
    var lineLimit: Int = 2
    @State private var expanded: Bool = false
    @State private var limitedHeight: CGFloat?
    @State private var textHeight: CGFloat?

    var body: some View {
        VStack(alignment: .trailing) {
            ViewThatFits {
                Text(text)
                if !expanded {
                    Text(text)
                        .fixedSize(horizontal: false, vertical: true)
                        .lineLimit(lineLimit)
                }
            }
            .frame(
                maxWidth: .infinity,
                maxHeight: expanded ? nil : limitedHeight,
                alignment: .leading
            )

            if let limitedHeight, let textHeight, limitedHeight < textHeight {
                Button(expanded ? "Less" : "More") {
                    expanded.toggle()
                }
                .contentTransition(.opacity)
                .buttonStyle(.borderless)
            }
        }
        .overlay {
            Text(text)
                .lineLimit(lineLimit)
                .hidden()
                .onGeometryChange(
                    for: CGFloat.self,
                    of: \.size.height) { update in
                        limitedHeight = update
                    }
            Text(text)
                .fixedSize(horizontal: false, vertical: true)
                .hidden()
                .onGeometryChange(
                    for: CGFloat.self,
                    of: \.size.height) { update in
                        textHeight = update
                    }
        }
    }
}

#Preview {
    NavigationStack {
        ViewThatFitsLines()
    }
}
