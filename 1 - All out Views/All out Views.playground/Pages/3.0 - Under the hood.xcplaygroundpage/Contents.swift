//: [Previous](@previous)

/*: # Under the hood

 As we previously said, `@ViewBuilder` is one of the result builders available in `SwiftUI`. Result builders allow you to build up a result using ‘build blocks’ lined up. They can be seen as an embedded domain-specific language (DSL) for collecting parts that get combined into a final result.

 We've seen how we can use it in the last chapter, but what about a glimpse on how it is defined?
 ```
 @resultBuilder struct ViewBuilder {
	 static func buildBlock(_ components: Component) -> Component {
	 }
 }
 ```
 So the black magic behind it, is that as `result builder`, `@ViewBuilder` has various `buildBlock` static functions that know how to handle multiple cases of combining views into a single result of type `View`. When no block is provided, an `EmptyView` is returned for us.

 👴 Remember the limitation of not being able to declare more than `10 Views` in `body`? A glimpse into the old `@ViewBuilder's` implementation allows us to understand why:

 ![@ViewBuilder buildBlock definitions](definitions.png)
 
 
 ## Pack,
 ## Each,
 ## Generics,
 ## Repeat!
 
 With the emergence of `packed parameters`, generics stepped up to a whole new game. This is how the old `@ViewBuilder buildBlock` looks now.
 
 ![@ViewBuilder build block new definitions](new_definitions.png)
 
 What does that mean? The compiler knows how to deduce the final type based on an arbitrary amount of generic views passed into the `@ViewBuilder` without the need of _explicit methods_.
 
 👍 Try adding 11 (or more) `Views` now in a container `View` ~ although, for readability reasons we would not recommend you doing this.
 
 */
//: [Next](@next)

