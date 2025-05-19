//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

/*:
 One of the newer additions to SwiftUI is `ViewThatFits`, which will swap out views based on content fitting.

 this can be used to either adapt you content to different window sizes at run time, or to present alternate layouts based on content fitting.
 */

struct FittingView: View {
    var body: some View {
        ViewThatFits {
            Color.red
                .frame(minWidth: 250)
                .aspectRatio(2, contentMode: .fit)
            Color.blue
                .frame(minHeight: 250)
                .aspectRatio(1/2, contentMode: .fit)
            Color.green
                .frame(minHeight: 100)
                .aspectRatio(1, contentMode: .fit)
        }
    }
}

//: The view that fits will evaluate from top to bottom, so if the first view fits, it will use that
PlaygroundPage.current.setLiveView(
    FittingView().frame(width: 400, height: 400))

//: Same if the second view fits
PlaygroundPage.current.setLiveView(
    FittingView().frame(width: 200, height: 300))

//: Same if the second view fits
PlaygroundPage.current.setLiveView(
    FittingView().frame(width: 200, height: 100))

//: Finally, if no view fits, then the last view will always be returned, even if it doesn't fit
PlaygroundPage.current.setLiveView(
    FittingView().frame(width: 200, height: 50))


//: If we want to adapt based on content, we can follow a similar pattern, but the content is going to determine what fits more than the window

//: To show an alternate view if you have more than 2 lines of text, we can read the height of the text when clipped to two lines, and the choose the un-clipped or clipped text as needed:

struct TwoLineText: View {
    let text: String

    @State private var height: CGFloat?

    var body: some View {
        ViewThatFits() {
            //: Even though we want to limit to 2 lines, we don't want to limit this view, because we want it to be too large to fit out sizing
            Text(text)
                .frame(maxWidth: .infinity, alignment: .leading)

            //: We want to use this to allow us to have a button under the text, without cropping the section line of text
            textWithButton
        }
        .frame(height: height)
        .frame(width: 300, height: 200)
        .background {
            //: We measure the text with button here and use that to read the maximum height
            textWithButton
                .hidden()
                .overlay {
                    GeometryReader { proxy in
                        Color.clear
                            .preference(key: TextHeightPreferenceKey.self, value: proxy.size.height)
                    }
                }
        }
        .onPreferenceChange(TextHeightPreferenceKey.self) { update in
            height = update
        }
    }

    private var textWithButton: some View {
        VStack(alignment: .trailing) {
            Text(text).lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .topLeading)
            Button("More") {
            }
        }
    }
}

PlaygroundPage.current.setLiveView(
    TwoLineText(text: "Test")
)

PlaygroundPage.current.setLiveView(
    TwoLineText(text: "Test\nTest")
)

PlaygroundPage.current.setLiveView(
    TwoLineText(text: "Test\nTest\nTest")
)

PlaygroundPage.current.setLiveView(
    TwoLineText(text: .longText)
)

//: [Next](@next)
