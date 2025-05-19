//: [Previous](@previous)

/*: # Create multiple child Views
 
 It might come as shock, but you are using it already:

 ```
 public protocol View {
	 associatedtype Body : View

	 @ViewBuilder var body: Self.Body { get }
 }
 ```

 And because the body property is defined using *@ViewBuilder* attribute, you can implement the view protocol as follows:
 
 */
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
	var body: some View {
		Text("Hello, world!")
			.padding()
		Text("You are attending a SwiftUI workshop!")
			.padding()
	}
}
 
/*:
 ⚠️ be mindful when returning multiple `Views` that are not embedded in a container : H(Lazy)Stack, V(Lazy)Stack etc, as in the example above.
 This will have different behaviours depending on where they end up being embedded into.
 */

struct NonEmbeddingView: View {
	var body: some View {
		ContentView()
			.frame(width: 150.0)
			.background(Color.red)
		HStack {
			Text("And now we're exploring @ViewBuilder.")
				.padding()
				.frame(width: 150.0)
		}
		.background(Color.green)
	}
}

PlaygroundPage.current.setLiveView(NonEmbeddingView())

/*:
Observe how `CustomView's` components are added on top of the other, as if embedded in a `VStack`, but they are treated as separate views altogether as the modifiers (`background` and `frame`) is applied to each view, separately, as opposed to the whole `View`.
 */

struct EmbeddedView: View {
	var body: some View {
		HStack {
			ContentView()
				.frame(width: 150.0)
				.background(Color.red)
			
			Text("And now we're exploring @ViewBuilder.")
				.padding()
				.frame(width: 150.0)
		}
		.background(Color.green)
	}
}

PlaygroundPage.current.setLiveView(EmbeddedView())

//: [Next](@next)
