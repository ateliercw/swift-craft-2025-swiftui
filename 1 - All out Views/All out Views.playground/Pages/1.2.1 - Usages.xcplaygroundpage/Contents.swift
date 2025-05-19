//: [Previous](@previous)

/*: # Usages
 
 `@ViewBuilder` can be used in different contexts to further enhance the API while benefitting from the previously outlined functionalities.
 
 ## Computed property definition:
 */

import SwiftUI

struct ComputedPropertyView: View {
	
	@State private var isEverybodyExcited = true
	
	var body: some View {
		content
	}
	
	@ViewBuilder var content: some View {
		if isEverybodyExcited {
			Text("Hello SwiftCraft 🎉")
		} else {
			Text("Pizza?")
		}
	}
}
 
/*:
 ## Method definition
 */
 
struct MethodView: View {

	var body: some View {
		conditionalContent(true)
	}
	
	/// Allows the same benefits of computed properties but we get the benefit of
	/// having a parameter based on which we can customise the output.
	@ViewBuilder func conditionalContent(_ isEverybodyExcited: Bool) -> some View {
		if isEverybodyExcited {
			Text("Hello SwiftCraft 🎉")
		} else {
			Text("Pizza?")
		}
	}
}

/*:
 ## Parameter definition
 */

struct ContainerExample<Content: View>: View {
	let content: Content
	
	init(@ViewBuilder _ content: () -> Content) {
		self.content = content()
	}
	
	var body: some View {
		VStack(spacing: 42.0) {
			content
		}
	}
}

/*:
 By doing so we streamline the API and enhance the functionality of `ContainerExample`.
 -> `return` not required;
 -> `content` can return more complex `View` hierarchies whereas without `@ViewBuilder` we could have only returned a single `View` type;
 
 ## Stored property definition
 */

struct StoredInContainerExample<Content: View>: View {
	@ViewBuilder var content: () -> Content
	
	var body: some View {
		VStack(spacing: 42.0) {
			content()
		}
	}
}
 
/*:
 ⚠️ `ContainerExample` and `StoredInContainerExample` might look the same but there is a subtle difference.
 In the former we're computing the `View` inside of the `init`, whereas here, the closure that computes the `View` will be stored. Make sure to check out the `Bonus` section for more on why the former is better than the later.
 */

//: [Next](@next)
