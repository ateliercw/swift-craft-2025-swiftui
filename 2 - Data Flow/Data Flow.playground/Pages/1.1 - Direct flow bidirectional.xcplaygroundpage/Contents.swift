//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

//: # Direct Flow

//: Bidirectional flow between child and parent

/*:
 If you want to be able to manipulate a value from within a child view, using a `Binding` allows you to safely change the value from either the parent or child.
 */

struct Child: View {
    @Binding var value: Int

    var body: some View {
        Button("Child increment") {
            value += 1
        }
    }
}

/*:
 If you want to store and change a value inside a view, using '@State' is required. It's a property wrapper which stores the value when the view struct is re-created, and triggers a view update if the value that it's storing changes.

 `@State` values should be `private` as they should not be modified from outside the view. If you need a value that needs to be managed by the parent, then you should use a `@Binding`.
 */

struct Parent: View {
    @State var value: Int = 0

    var body: some View {
        VStack {
            Text("\(value, format: .number)")
            Button("Parent increment") {
                value += 1
            }
            Child(value: $value)
        }
    }
}

PlaygroundPage.current.setLiveView(Parent().padding())

//: [Next](@next)
