//
//  Color+random.swift
//  Layouts
//
//  Created by Michael Skiba on 13/05/2025.
//

import SwiftUI

extension Color {
    public static var random: Color {
        .init(
            hue: .random(in: 0...1),
            saturation: .random(in: 0.25...1),
            brightness: .random(in: 0.6...(0.9))
        )
    }
}

#Preview {
    Grid(horizontalSpacing: 0, verticalSpacing: 0) {
        ForEach(0..<7) { _ in
            GridRow {
                ForEach(0..<4) { _ in
                    Color.random
                }
            }
        }
    }
}
