//: [Previous](@previous)

/*: # Return multiple subtypes of `View` in the same block of code

 The ***some*** keyword defines an opaque type, meaning that we can ignore the return concrete type as long as the returned value conforms to the opaqued type, but with some limitations. (more details about how opaque types work [here](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/opaquetypes)).
 It is particularly useful for `SwiftUI` because it allows chaining multiple modifiers and not stress much about the returned type as most modifiers return `some View` as well.
 
 Back to the limitations: even though _we_ do not care about the final return type, the compiler does. Hence, he needs to infer/ resolve the `underlying return type`. For this reason, the return type needs to be `consistent` across all execution branches.
 */
import SwiftUI

protocol CustomView {
	associatedtype Body : View

	var body: Self.Body { get }
}

struct ContentView: CustomView {
	@State var showButton = true
	@State var showDeliciousText = true

	/// 1️⃣: observe the compiler error;
	/// 2️⃣: add `@ViewBuilder` to the help the compiler determine the underlying type;
	var body: some View {
		if showButton {
			Button {
				showButton = false
			} label: {
				presentationText
			}
			.padding()
		} else {
			presentationText
				.padding()
		}
	}

	/// ⚠️ However, having the same return type works well without '@ViewBuilder'.
	var presentationText: some View {
		if showDeliciousText {
			return Text("🍕 is yours!!")
		} else {
			return Text("Press to take what is yours")
		}
	}
}

/*:
 `@ViewBuilder` fixes this problem by returning a wrapper type represents all the return types that the `View` contains.
 Observe from the error how the full underlying type is resolved and how `@ViewBuilder` mitigates different return types based on `condition`.
 */

@ViewBuilder func conditionalContent(_ condition: Bool) -> _ConditionalContent<Text, HStack<TupleView<(Image, Text)>>> {
	if condition {
		Text("This label is true")
	} else {
		HStack {
			Image(systemName: "exclamationmark.triangle")
			Text("Invalid input!")
		}
	}
}

/*:
 There is some compiler gymnastics involved and a some types that we cannot really inspect.
 
 ![types](types.png)
 */

//: [Next](@next)
