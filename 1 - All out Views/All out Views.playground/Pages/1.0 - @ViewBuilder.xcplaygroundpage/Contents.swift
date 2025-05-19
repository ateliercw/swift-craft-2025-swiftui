//: [Previous](@previous)

/*: # @ViewBuilder

 `@ViewBuilder` harnesses the power of `result builders`, which is a fancy term around "you don't need to add the return keyword", to streamline the API for composing (building) `Views` in a `declarative` way. Another fundamental role of `@ViewBuilder` is to hide away the complexity of satisfying the type constraints of an `opaque return type requirement`: `var someCustomView: some View`.
  
 While `some` offers great generics flexibility and power, not needing to care about the _exact_ return type, it forces your `return type to be consistent`. That means that code like:
 
 ```swift
 var someCustomView: some View {
    if condition {
        return Text("Success")
    } else {
        return Image("failure_banner")
    }
 }
 ```
 would not compile, thus, making `SwiftUI` unusable except for limited scenarios.
 We'll later explore _how_ `@ViewBuilder` solves this situation.
 
 Other scenarios in which we found `@ViewBuilder` useful:
 
 1. Create multiple child Views;
 
 2. Return multiple subtypes of `View` in the same block of code;
*/

//: [Next](@next)
