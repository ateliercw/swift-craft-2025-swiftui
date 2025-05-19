import SwiftUI

public extension String {
    static var longText: String = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer et nunc sit amet orci auctor viverra. Vestibulum tempor, dui ut tincidunt porttitor, nunc quam accumsan ex, sed commodo arcu ipsum consequat urna. Sed feugiat, nisl sed auctor congue, nisl enim bibendum arcu, ac vehicula nulla arcu eu nunc. Aenean rutrum pharetra consectetur. Suspendisse nec ex neque. Nunc semper eleifend orci, ut interdum nisl sodales sed. Nunc metus libero, scelerisque vitae neque eget, lacinia euismod est.

Quisque varius, elit ut convallis luctus, sem nibh tempus lectus, in semper velit lectus a purus. Maecenas aliquet lorem in dolor pulvinar pretium. Etiam pulvinar eleifend turpis et eleifend. Phasellus ornare interdum tristique. Nunc nec mauris suscipit, feugiat libero et, elementum leo. Nunc hendrerit pulvinar risus id feugiat. Duis eleifend sodales lorem et accumsan. Maecenas egestas est finibus massa sodales tristique. Quisque et risus eu neque sodales iaculis quis eget nulla.
"""
}

public struct TextHeightPreferenceKey: PreferenceKey {
    public static let defaultValue: CGFloat? = nil

    public static func reduce(value: inout CGFloat?, nextValue: () -> CGFloat?) {
        guard let next = nextValue() else { return }
        //: Since we always want the widest value, we always pass the value when reading the key
        if next > (value ?? -.infinity) {
            value = next
        }
    }
}
