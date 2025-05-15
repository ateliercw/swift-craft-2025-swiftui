//
//  AlignmentGuidesView.swift
//  Layouts
//
//  Created by Michael Skiba on 14/05/2025.
//

import SwiftUI

struct AlignmentGuidesView: View {
    var body: some View {
        List {
            Section("Corner Badge") {
                cornerBadgeView
                    .padding()
            }
            Section("Custom") {
                customGuideView
            }
        }
        .listStyle(.grouped)
        .navigationTitle("Alignment Guides")
    }
}

private extension AlignmentGuidesView {
    var cornerBadgeView: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(.thinMaterial.shadow(.drop(radius: 1)))
            .aspectRatio(1, contentMode: .fit)
            .overlay(alignment: .topTrailing) {
                Circle()
                    .fill(.red.shadow(.drop(radius: 2)))
                    .frame(width: 72)
                    .alignmentGuide(.top) { d in
                        d[.top] + 16
                    }
                    .alignmentGuide(.trailing) { d in
                        d[.trailing] - 16
                    }
            }
    }

    @ViewBuilder
    var customGuideView: some View {
        let spacing: CGFloat = 8

        HStack(alignment: .arbitrary) {
            VStack(spacing: spacing) {
                Circle()
                Circle()
                    .alignmentGuide(.arbitrary) { d in d[.top] }
                Circle()
                Circle()
            }
            .frame(width: 24)
            VStack(spacing: spacing) {
                Circle()
                    .alignmentGuide(.arbitrary) { d in d[.top] }
            }
            .frame(width: 24)
            VStack(spacing: spacing) {
                Circle()
                    .alignmentGuide(.arbitrary) { d in d[.top] }
                Circle()
            }
            .frame(width: 24)
            VStack(spacing: spacing) {
                Circle().alignmentGuide(.arbitrary) { d in d[.top] - d.height - spacing }
            }
            .frame(width: 24)
            VStack(spacing: spacing) {
                Circle()
                Circle()
                    .alignmentGuide(.arbitrary) { d in d[.top] }
            }
            .frame(width: 24)
        }
        .foregroundStyle(.blue.shadow(.inner(radius: 1)))

        HStack(alignment: .arbitrary) {
            VStack(spacing: spacing) {
                Circle()
                Circle()
                    .alignmentGuide(.arbitrary) { d in d[.top] }
                Circle()
                Circle()
            }
            .frame(width: 24)
            VStack(spacing: spacing) {
                Circle()
                    .alignmentGuide(.arbitrary) { d in d[.top] }
                Circle()
                Circle()
                Circle()
            }
            .frame(width: 24)
            VStack(spacing: spacing) {
                Circle()
                Circle()
                Circle()
                    .alignmentGuide(.arbitrary) { d in d[.top] }
                Circle()
            }
            .frame(width: 24)
        }
        .foregroundStyle(.blue.shadow(.inner(radius: 1)))
    }
}

extension VerticalAlignment {
    struct ArbitraryAlignment: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }

    static let arbitrary = VerticalAlignment(ArbitraryAlignment.self)
}

#Preview {
    NavigationStack {
        AlignmentGuidesView()
    }
}
