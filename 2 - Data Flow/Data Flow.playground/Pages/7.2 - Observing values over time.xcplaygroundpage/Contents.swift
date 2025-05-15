//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

//: ## Observing values over time

/*:

 The model crashed Playgrounds if we included it directly in the file, so it's in the sources subdirectory for reference.
 */

struct TimerView: View {
    @State private var timerModel = TimerModel()

    var body: some View {
        VStack {
            Text("\(timerModel.tick, format: .number)")
            if timerModel.isRunning {
                Button("Stop", action: timerModel.stop)
            } else {
                Button("Start", action: timerModel.start)
            }
        }
    }
}

PlaygroundPage.current.setLiveView(
    TimerView()
        .padding()
)

//: [Next](@next)
