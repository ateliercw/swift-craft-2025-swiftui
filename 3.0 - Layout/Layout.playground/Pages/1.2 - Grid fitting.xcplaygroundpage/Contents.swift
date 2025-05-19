//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

/*: # Grids
 
 For scenarios where you need to align and arrange `Views` across 2 dimensions ~ this could be technically possible with a combination of VStack and HStack and a lot of PreferenceKeys.
 
 One useful thing to know if is you add an adaptive column to a hGrid or vGrid and it will automatically re-flow the content to fill the space as needed
 */

struct AdaptingVGrid: View {
    var body: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 100, maximum: 100))]) {
            ForEach(0..<9) { cell in
                Text("\(cell)")
                    .frame(maxWidth: .infinity)
                    .frame(height: 100)
                    .background(.red)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ScrollView {
    AdaptingVGrid()
}.frame(width: 220, height: 600))

PlaygroundPage.current.setLiveView(ScrollView {
    AdaptingVGrid()
}.frame(width: 400, height: 400))

struct AdaptingHGrid: View {
    var body: some View {
        LazyHGrid(rows: [GridItem(.adaptive(minimum: 100, maximum: 100))]) {
            ForEach(0..<9) { cell in
                Text("\(cell)")
                    .frame(maxHeight: .infinity)
                    .frame(width: 100)
                    .background(.red)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ScrollView(.horizontal)  {
    AdaptingHGrid()
}.frame(width: 220, height: 300))

PlaygroundPage.current.setLiveView(ScrollView(.horizontal) {
    AdaptingHGrid()
}.frame(width: 400, height: 200))

//: [Next](@next)
