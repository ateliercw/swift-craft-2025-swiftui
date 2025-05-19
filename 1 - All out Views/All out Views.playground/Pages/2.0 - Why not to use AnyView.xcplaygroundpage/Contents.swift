//: [Previous](@previous)

/*: # Why and how to avoid `AnyView`
 
 Multiple return types can be solved by wrapping the views in `AnyView`, erasing their type and pleasing the compiler.
 
 While this is not wrong, is not ideal because `SwiftUI` uses a type-based algorithm to determine when a `View` should be redrawn or not. Hence, two `AnyView-wrapped Views` will always look "identical" from the type system’s perspective (even if their underlying, wrapped types are **different**). This kind of type erasure significantly reduces SwiftUI’s ability to efficiently update our views.
 
  So, even if there are cases in which we might need to use `AnyView`, it’s often best to avoid it as much as possible.
 
 Here are some examples on how to avoid `AnyView`:
 
 ## 1. Multiple return types:
 
 Best way is using the result builder we keep talking about, **@ViewBuilder**, so just mark the function/property with it. It also makes the code easier on the eyes.
 */

import SwiftUI

struct MultipleExample: View {
	@Binding var name: String
	var isEditable: Bool
	public var body: some View {
		content
	}

	/* 👎 approach
	private var content: AnyView {
		if isEditable {
			return AnyView(TextField("Name", text: $name))
		} else {
			return AnyView(Text(name))
		}
	}
	 */
	
	/* 👍 approach */
	@ViewBuilder private var content: some View {
		if isEditable {
			TextField("Name", text: $name)
		} else {
			Text(name)
		}
	}
}

/*:
 ## 2. Generic properties
 
 Sometimes a `View` embeds a logic for rendering/ displaying/ laying its `content` (typical for container Views).
 Hence, we need to pass the `content` as an argument. But that requires us to know the content's type and, no, we can't use `some View`.
 */

struct BadGenericView: View {
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	let content: AnyView
	var layout: AnyLayout {
		if horizontalSizeClass == .compact {
			return AnyLayout(VStackLayout())
		} else {
			return AnyLayout(HStackLayout())
		}
	}

	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text("Please select your avatar:")
			layout {
				content
			}
		}
	}
}

/*:
 So to fix it, we can take a look at how SwiftUI container types are defined:
 
 ```
 struct HStack<Content: View>: View {
	...
 }
 ```

 So we make the property adopt the exact same pattern — which will let us directly inject any View-conforming type as our `content`:
 */

struct GoodGenericView<Content: View>: View {
	@Environment(\.horizontalSizeClass) var horizontalSizeClass
	let content: Content
	var layout: AnyLayout {
		if horizontalSizeClass == .compact {
			return AnyLayout(VStackLayout())
		} else {
			return AnyLayout(HStackLayout())
		}
	}
	
	var body: some View {
		VStack(alignment: .leading, spacing: 8) {
			Text("Please select your avatar:")
			layout {
				content
			}
		}
	}
}
//: [Next](@next)
