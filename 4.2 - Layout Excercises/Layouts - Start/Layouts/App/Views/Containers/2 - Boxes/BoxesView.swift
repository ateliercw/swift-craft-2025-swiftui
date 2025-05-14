//
//  BoxesView.swift
//  Layouts
//
//  Created by Michael Skiba on 13/05/2025.
//

import SwiftUI

struct BoxesView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                GroupBox("Default") {
                    VStack(alignment: .leading) {
                        GroupBoxContent(aspect: 16/9)
                    }
                }

                GroupBox("Horizontal") {
                    GroupBoxContent(aspect: 1)
                }
                .frame(maxHeight: 200)
                .groupBoxStyle(HorizontalGroupBoxStyle())

                GroupBox("Inset") {
                    GroupBoxContent(aspect: 16/9)
                }
                .groupBoxStyle(InsetGroupBoxStyle())
            }
            .padding()
        }
        .navigationTitle("Boxes")
    }
}

struct HorizontalGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        GroupBox {
            HStack(alignment: .top) {
                configuration.content
            }
        } label: {
            configuration.label
        }
        .groupBoxStyle(.automatic)
    }
}

struct InsetGroupBoxStyle: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading, spacing: 4) {
            configuration.label
            configuration.content
        }
    }
}

#Preview {
    NavigationStack {
        BoxesView()
    }
}
