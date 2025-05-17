//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

/*:

 ## Observing scroll phase changes

 The `onScrollPhaseChange` modifier is helpful because it allows you react to when the phase of a scroll view changes, including when the user starts interacting, and when the view is decelerating or idle.
 */

struct PhaseChangeView: View {
    @State private var text = ""
    @State private var showSquare = false

    var body: some View {
        ScrollView {
            LinearGradient(colors: [.red, .blue], startPoint: .top, endPoint: .bottom)
                .frame(height: 1200)
        }
        .safeAreaInset(edge: .bottom) {
            Text(text)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.thinMaterial)
        }
        .onScrollPhaseChange { _, current, context in
            text =  "\(current) - \(context.geometry.contentOffset.y)"
        }
        .frame(width: 300, height: 600)
    }
}

PlaygroundPage.current.setLiveView(PhaseChangeView())

//: [Next](@next)
