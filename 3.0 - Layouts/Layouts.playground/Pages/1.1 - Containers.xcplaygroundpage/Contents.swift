//: [Previous](@previous)

/*: # Containers
 
 `Views` like `HStack`, `VStack` (and their lazy counterparts), `ZStack` do not have an appearance by themselves: they handle how their child views are arranged. That's why they are called "container" Views.
 
 While they fulfil most of the use cases that we need in our apps because of their opinionated way they layout subviews, there might be situations where you might need just a bit more power.
 
 ## ForEach(subviews:content:)
 
 The `ForEach` got magic capabilities in `iOS 18.0` which allow you to get access to the underlying `subviews` (the actual type you get access to is `Subview` ~ look it up!) of a specific `View`.
 
 While it's highly dependent on the context (what is the underlying type of that passed in `View`) you _can_ have an influence over how the `Views` are placed. But mostly is used for styling.
 */
 
import SwiftUI
import PlaygroundSupport

struct RoundedCornerContainer<Content: View>: View {
    
    @ViewBuilder let content: Content
    
    var body: some View {
        // 2. Add an HStack here.
        HStack {
            ForEach(subviews: content) { subview in
                subview
                    .padding()
                    .background(.orange)
                    .clipShape(.rect(cornerRadius: 8.0))
            }
        }
    }
}

struct ContentView: View {
    
    var body: some View {
        RoundedCornerContainer {
            // 1. Add an HStack here.
            Text("This")
            Text("is")
            Text("my first")
            Text("layout.")
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())
 
/*:
 You can get only so far with `ForEach(subviews:content:)` since your "container View" is still a `View` at the end of the day. That means that you still need to abide by the same layouts other containers offer you: horizontal, vertical placement.
 
 ## The Layout protocol
 
 Is a special type that is permitted and handled by `SwiftUI` in any context where you would use a `View`.
 
 ![How Layout maps to UICollectionViewDelegateFlowLayout](old_layout.png)
 
 Allows you to create your own `Container` type of `View` with maximum control over where a View is placed; how big a View is and when that is supposed to change and how.
 
 2 simple implementation requirements.
 
 - `sizeThatFits(proposal:subviews:cache:)` : reports the size of the composite layout view;
 - `placeSubviews(in:proposal:subviews:cache:)` : assigns positions to the container’s subviews;
 
 ## Canvas ~ honourable mention
 
 While this doesn't "layout" Views in a traditional way, it gives you unrestricted power to draw any geometrical form on the screen.
 */



//: [Next](@next)
