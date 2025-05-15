//
//  GroupBoxContent.swift
//  Layouts
//
//  Created by Michael Skiba on 13/05/2025.
//

import SwiftUI

struct GroupBoxContent: View {
    let aspect: CGFloat

    var body: some View {
        Group {
            Color.clear
                .aspectRatio(aspect, contentMode: .fit)
                .overlay {
                    Image(.gears)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .mask(RoundedRectangle(cornerRadius: 12))
            
            
            Text((try? AttributedString(markdown: "A photo of gears inside a watch, taken from [Unsplash](https://unsplash.com/photos/gold-and-black-leather-textile-u_RiRTA_TtY)")) ?? "")
        }
    }
}
