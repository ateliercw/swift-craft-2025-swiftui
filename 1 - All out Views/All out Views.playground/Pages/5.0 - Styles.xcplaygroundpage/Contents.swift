//: [Previous](@previous)

/*:
 # Styles
 
 Styles are everywhere in `SwiftUI` and Apple always nudges us use them when you need to, well, _style_ a visual component.
 
 Some of the `primitive Views` have their own style: `Button`, `Picker`, `List`, `TextField`, `Toggle`, `ProgressView`; just to name a few usual ones. Type `style` and see if the `View` you want to use offers this functionality.
 
 But what are the actual benefits of using them?
 Let's look at the following:
 */

import SwiftUI
import PlaygroundSupport

struct MyButton: View {
    
    let title: String
    let action: () -> Void
    private let iconWidth = 24.0
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(title)
                    .frame(maxWidth: .infinity)
                    // In order to centre the title relative to the whole button label
                    // add the same padding to the leading edge as the icon occupies to the trailing edge.
                    .padding(.leading, iconWidth)
                
                Image(systemName: "arrow.forward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: iconWidth)
            }
            .font(.title3)
            .fontWeight(.semibold)
            .padding()
            .background(Color.blue)
            .clipShape(.capsule)
            .foregroundStyle(Color.primary)
        }
    }
}

struct MyButtonStyle: ButtonStyle {
    
    private let iconWidth = 24.0
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
                .frame(maxWidth: .infinity)
                // In order to centre the title relative to the whole button label
                // add the same padding to the leading edge as the icon occupies to the trailing edge.
                .padding(.leading, iconWidth)
            
            Image(systemName: "arrow.forward")
                .resizable()
                .scaledToFit()
                .frame(width: iconWidth)
        }
        .font(.title3)
        .fontWeight(.semibold)
        .padding()
        .background(Color.blue)
        .clipShape(.capsule)
        .foregroundStyle(Color.primary)
    }
}

print("\n\n === Button comparison === \n\n")
PlaygroundPage.current.setLiveView(
    VStack {
        MyButton(title: "Custom Button") {
            print("Tapped custom button!")
        }
        
        Button("Custom Button") {
            print("Tapped custom button style button!")
        }
            .buttonStyle(MyButtonStyle())
    }
        .padding()
)

/*:
 Obviously they both have their use cases and your choice depends solely on your application's needs.
 
 🍏 If you want to preserve the default button tap behaviour, style your button using the `Button(action:label:)` initializer. If you want to _strongly enforce_ how all your buttons should look in your app, you might be well off by creating your own custom button implementation.
 
 🎨 If you want more control, _flexibility_ and customization, you should definitely consider using the `Style`.
 
 ---
 
 All `Styles` allow you to alter the **visual appearance** of a `primitive View` in its true form, and some also give you access to lifecycle properties/ events without which certain customizations are not trivial to implement. (_have you tried implementing a button press animation without implementing a `ButtonStyle`?_)
 
 ![True button definition](button_true_definition.png)
 */

/*:
 ## Summary
 
 ⚠️ One final consideration we want you to think before choosing is `init`. The primitive components already come packed with a lot of _convenience_ initializers for their components.
 
 ```
 @preconcurrency nonisolated public init(_ titleKey: LocalizedStringKey, action: @escaping @MainActor () -> Void)

 @preconcurrency nonisolated public init<S>(_ title: S, action: @escaping @MainActor () -> Void) where S : StringProtocol

 nonisolated public init(_ titleKey: LocalizedStringKey, systemImage: String, action: @escaping @MainActor () -> Void)

 nonisolated public init<S>(_ title: S, systemImage: String, action: @escaping @MainActor () -> Void) where S : StringProtocol

 @preconcurrency nonisolated public init(_ titleKey: LocalizedStringKey, image: ImageResource, action: @escaping @MainActor () -> Void)

 @preconcurrency nonisolated public init<S>(_ title: S, image: ImageResource, action: @escaping @MainActor () -> Void) where S : StringProtocol

 @available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
 nonisolated public init(_ configuration: PrimitiveButtonStyleConfiguration)

 @preconcurrency nonisolated public init(role: ButtonRole?, action: @escaping @MainActor () -> Void, @ViewBuilder label: () -> Label)

 @preconcurrency nonisolated public init(_ titleKey: LocalizedStringKey, role: ButtonRole?, action: @escaping @MainActor () -> Void)

 @preconcurrency nonisolated public init<S>(_ title: S, role: ButtonRole?, action: @escaping @MainActor () -> Void) where S : StringProtocol

 nonisolated public init(_ titleKey: LocalizedStringKey, systemImage: String, role: ButtonRole?, action: @escaping @MainActor () -> Void)

 nonisolated public init<S>(_ title: S, systemImage: String, role: ButtonRole?, action: @escaping @MainActor () -> Void) where S : StringProtocol

 @preconcurrency nonisolated public init(_ titleKey: LocalizedStringKey, image: ImageResource, role: ButtonRole?, action: @escaping @MainActor () -> Void)
 
 @preconcurrency nonisolated public init<S>(_ title: S, image: ImageResource, role: ButtonRole?, action: @escaping @MainActor () -> Void) where S : StringProtocol
 ```
 
 If you want to support the same level of flexibility on your custom component, keep in mind that you might have to maintain parity.
 */

struct MyBoxStyle: GroupBoxStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
            Divider()
            configuration.content
                .fontDesign(.monospaced)
                .fontWeight(.semibold)
        }
        .padding()
        .background(.yellow)
    }
}

print("\n\n === Button comparison === \n\n")
PlaygroundPage.current.setLiveView(
    VStack(alignment: .leading) {
        Text("Welcome to SwiftCraft")
        
        GroupBox("Workshop Structure") {
            VStack(alignment: .leading) {
                Text("• Walkthrough of Chapters")
                Text("• Concepts briefing")
                Text("• Hands-on exercise")
                    .fontDesign(.serif)
            }
        }
    }
//        .fontWeight(.thin)
//        .groupBoxStyle(MyBoxStyle())
//        .fontWeight(.thin)
)

/*:
 
 ## Inner customization
 ⚠️ The initial customization of the `definition` of the component will be preserved and not overriden/ replaced by the `Style` since the same `SwiftUI` rules apply. While not so obvious, it can lead to some visual inconsistencies for more complex `Views`.

 ## Outer customization
 💭 uncomment the lines above. What do you think will happen?
 
 Attempting to alter the visual appearance of a styled component will **not** take precedence (for the same modifiers) over its `Style`. This means that no matter how far down the hierarchy we declare the style, it will be used first, before any other modifiers are applied.
 */

//: [Next](@next)

