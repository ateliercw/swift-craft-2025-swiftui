//
//  ParrallaxScrollingView.swift
//  Layouts
//
//  Created by Michael Skiba on 14/05/2025.
//

import SwiftUI

struct ParallaxScrollingView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(Section.allCases) { section in
                    VStack(alignment: .leading) {
                        ScrollTrackingView(image: section.image)
                            .padding(.bottom, 128)
                    }
                }
            }
            .navigationTitle("Parallax Scrolling")
            .navigationBarTitleDisplayMode(.inline)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

private struct ScrollTrackingView: View {
    let image: Image
    var height: CGFloat = 120
    var padding: CGFloat = 30
    @State private var progress: CGFloat?

    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(height: height)
            .padding(.vertical, padding)
            .padding(.vertical, padding / 4)
            .alignmentGuide(.bottom) { d in
                if let progress {
                    return d[.bottom] - (padding * 2) * progress
                } else {
                    return d[.bottom]
                }
            }
            .frame(height: height, alignment: .bottom)
            .clipped()
            .overlay {
                Rectangle()
                    .fill(.white.shadow(.inner(color: .black, radius: 10)).blendMode(.multiply))
                    .padding(.horizontal, -10)
            }
            .onGeometryChange(for: CGFloat?.self) { geometry in
                guard var height = geometry.bounds(of: .scrollView)?.size.height else { return nil }
                let insets = geometry.safeAreaInsets
                height -= insets.top + insets.bottom
                let offset = geometry.frame(in: .scrollView).minY
                return (height - offset) / height
            } action: { update in
                progress = update
            }

    }
}

private extension ParallaxScrollingView {
    enum Section: Hashable, Identifiable, CaseIterable {
        var id: Self { self }

        case one
        case two
        case three
        case four
        case five
        case six

        var image: Image {
            switch self {
            case .one:
                Image(ImageResource.Header.image1)
            case .two:
                Image(ImageResource.Header.image2)
            case .three:
                Image(ImageResource.Header.image3)
            case .four:
                Image(ImageResource.Header.image4)
            case .five:
                Image(ImageResource.Header.image5)
            case .six:
                Image(ImageResource.Header.image6)
            }
        }
    }
}

#Preview {
    NavigationStack {
        ParallaxScrollingView()
    }
}
