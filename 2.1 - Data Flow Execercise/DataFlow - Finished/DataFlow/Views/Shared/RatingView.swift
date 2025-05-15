//
//  RatingView.swift
//  DataFlow
//
//  Created by Michael Skiba on 12/05/2025.
//

import SwiftUI

struct RatingView: View {
    let rating: Int
    @ScaledMetric var spacing: CGFloat = -4
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        HStack(spacing: spacing) {
            ForEach(0..<5) { star in
                let showStar = star < rating
                Image(systemName: "star")
                    .foregroundStyle(showStar ? .primary : .tertiary).background {
                        if showStar {
                            Image(systemName: "star.fill")
                                .foregroundStyle(.yellow.secondary)
                        }
                    }
                    .fontWeight(colorScheme == .dark ? .regular : .thin)
            }
        }
    }
}

#Preview("Basic", traits: .sizeThatFitsLayout) {
    VStack {
        ForEach(0..<6) { rating in
            RatingView(rating: rating)
        }
    }
}

#Preview("Accessibility", traits: .sizeThatFitsLayout) {
    VStack {
        ForEach(0..<6) { rating in
            RatingView(rating: rating)
        }
    }
    .environment(\.dynamicTypeSize, .accessibility2)
}
