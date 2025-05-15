//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

/*:
Finally, the `.scrollView` coordinate space was added in iOS 17, which allows you to read the frame of a view in the nearest scroll view, and also the geometry of the scroll view, which makes it easy to calculate view position relative to that view.
 */

struct OffsetTrackingView: View {
    var index: Int
    @State private var offset: CGFloat = 0

    var body: some View {
        VStack(alignment: .leading) {
            Text("View \(index)")
                .font(.caption)
                .foregroundStyle(.secondary)
            Text("Offset in scroll view is: \(offset, format: .number.precision(.fractionLength(0)))")
        }
        .onGeometryChange(for: CGFloat.self) { geometry in
            geometry.frame(in: .scrollView).minY
        } action: { update in
            offset = update
        }
    }
}

struct PositionTrackingView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 60) {
                ForEach(0..<20) { index in
                    OffsetTrackingView(index: index)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .frame(width: 300, height: 600)
    }
}

PlaygroundPage.current.setLiveView(PositionTrackingView())

//: [Next](@next)
