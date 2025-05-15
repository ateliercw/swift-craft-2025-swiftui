//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

//: ## Persistent storage

struct StorageView: View {
    @AppStorage("counter") var counter = 0

    var body: some View {
        VStack {
            Text("Counter: \(counter, format: .number)")
            Button("Increment") {
                counter += 1
            }
        }
    }
}

/*:
 This stores values in `UserDefaults`, and can only store a handful of standard types before you need to do things with encoding / decoding values.

 So while this is useful for basic values, storing anything complex should use a framework like SwiftData, GRDB, or another persistence framework that offers more flexibility.
 */

PlaygroundPage.current.setLiveView(
    StorageView()
        .padding()
)

//: [Next](@next)
