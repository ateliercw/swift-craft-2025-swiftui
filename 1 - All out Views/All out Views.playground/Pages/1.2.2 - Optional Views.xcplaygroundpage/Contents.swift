//: [Previous](@previous)

/*: # Optional views

 One very neat implication of `@ViewBuilder` and how it resolves opaque types is that it allows us to work with `Optionals` directly with `Views`.
 What are those scenarios in `SwiftUI`?
 1. not returning any `Views` in conditional statements;
 2. a `View` with an `Optional init`;

 How does that look like by default? The compiler is complaining about not having any returned view from which it can infer the type.
 
 ![Missing return error](error.jpg)

 `@ViewBuilder` resolves those situations by replacing that type with an `EmptyView` further streamlining the API usage by not having to manually handle all conditional cases/ unwrapping of `Views`.
 */
import SwiftUI
import PlaygroundSupport

struct ProfileView: View {
	let selectedAvatar: String

	init?(selectedAvatar: String?) {
		guard let selectedAvatar else { return nil }
		self.selectedAvatar = selectedAvatar
	}
	
	public var body: some View {
		VStack(alignment: .center, spacing: 20) {
			Text("This is your selected avatar")
				.font(.headline)
			Image(systemName: selectedAvatar)
				.font(.system(size: 60))
				.padding()
		}
			.background(Color.mint)
	}
}

struct ProfilesHeader: View {
	
	let displayHint: Bool
	
	var body: some View {
		VStack {
			hint
			ProfileView(selectedAvatar: "studentdesk")
			
			// Init that will return `nil` and will result in `EmptyView`.
			ProfileView(selectedAvatar: nil)
		}
	}
	
	/// Untreated `if` case that will result in `EmptyView`
	@ViewBuilder var hint: some View {
		if displayHint {
			Text("Make `displayHint` false to see what happens!")
		}
	}
}

PlaygroundPage.current.setLiveView(ProfilesHeader(displayHint: true))
//: [Next](@next)
