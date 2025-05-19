//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

/*: ## Design patterns

 We've established the various methods for moving data around, so lets talk about some things to keep in mind when deciding how to use these tools.

 ### View Models

 Depending on the complexity of your view, it may be useful to create view models to let you separate view layout code from other code.

 `Environment` and `EnvironmentObject` aren't the right place to inject dependencies into them, because the environment isn't available in 'init' for a `View`, it won't become available until the view is placed in the view tree. So dependencies for your view models need to injected some other way.

 */
