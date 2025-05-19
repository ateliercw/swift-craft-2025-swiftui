//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

//: ## Working with Objects

/*:
 Prior to iOS 17, to observe an object it required using the `ObservableObject` protocol, adding `@Published` in front of all of the properties. It also updated every view referencing it when any value changed.

 The `@Observable` macro requires fewer annotations, and only updates a view if a property that the view is reading is referenced.
 */
@Observable class BaseModel {
    private(set) var left: Int = 0
    private(set) var right: Int = 0

    func incrementLeft() {
        left += 1
    }

    func incrementRight() {
        right += 1
    }
}

/*:
 We can use `onReceive` to react each time the publisher sends an event.
 */
struct PublisherSideView: View {
    let value: Int
    let label: String
    let update: () -> Void

    var body: some View {
        VStack {
            Text("\(label): \(value, format: .number)")
                .fixedSize()
                .font(.body.monospacedDigit().bold())
                .background(Color.random)
            Button("Increment", action: update)
        }
    }
}
struct PublisherView: View {
    let viewModel = BaseModel()

    var body: some View {
        VStack {
            HStack {
                Text("Left: \(viewModel.left, format: .number)")
                    .fixedSize()
                    .font(.body.monospacedDigit().bold())
                    .background(Color.random)
                Text("Right: \(viewModel.right, format: .number)")
                    .fixedSize()
                    .font(.body.monospacedDigit().bold())
                    .background(Color.random)
            }
            HStack {
                PublisherSideView(
                    value: viewModel.left,
                    label: "Left",
                    update: viewModel.incrementLeft
                )
                PublisherSideView(
                    value: viewModel.right,
                    label: "Right",
                    update: viewModel.incrementRight
                )
            }
        }
    }
}

PlaygroundPage.current.setLiveView(PublisherView().padding())

//: [Next](@next)
