//
//  CounterView.swift
//  DataFlow
//
//  Created by Michael Skiba on 11/05/2025.
//

import SwiftUI

struct CounterView: View {
    let label: LocalizedStringKey
    @Binding var count: Int

    var body: some View {
        Stepper {
            Text(label)
        } onIncrement: {
            if count < 25 {
                count += 1
            }
        } onDecrement: {
            if count > 0 {
                count -= 1
            }
        }
    }
}

#Preview {
    @Previewable @State var count = 0
    Form {
        CounterView(label: "Preview \(count)", count: $count)
    }
}
