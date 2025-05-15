//
//  Color+Random.swift
//  
//
//  Created by Michael Skiba on 11/05/2025.
//

import SwiftUI

public extension Color {
    static var random: Color {
        Color(
            hue: .random(in: 0...1),
            saturation: .random(in: (0.25)...1),
            brightness: .random(in: (0.75)...(0.95))
        )
    }
}
