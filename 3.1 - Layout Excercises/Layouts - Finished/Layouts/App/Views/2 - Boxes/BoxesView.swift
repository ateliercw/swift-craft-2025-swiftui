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

                GroupBox("Color (red)") {
                    GroupBoxContent(aspect: 4/6)
                }
                .groupBoxStyle(ColoredStrokeGroupBoxStyle(color: .red))

                GroupBox("Color (blue)") {
                    GroupBoxContent(aspect: 4/3)
                }
                .groupBoxStyle(.coloredStoke(.blue))
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
                .padding(.leading)
                .font(.title)
            VStack(alignment: .leading) {
                configuration.content
            }
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 24)
                    .fill(.background.shadow(.inner(radius: 1, y: 0.5)))
            }
        }
        .fontDesign(.serif)
    }
}

struct ColoredStrokeGroupBoxStyle: GroupBoxStyle {
    let color: Color

    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .font(.largeTitle.bold())
                .foregroundStyle(LinearGradient(colors: [.primary, color, color], startPoint: .leading, endPoint: .trailing)
                    .shadow(.inner(radius: 2)))
            configuration.content
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 24)
                .fill(.thinMaterial)
            RoundedRectangle(cornerRadius: 24)
                .stroke(color, lineWidth: 2)
        }
        .compositingGroup()
        .shadow(radius: 3, y: 1)
    }
}

extension GroupBoxStyle where Self == ColoredStrokeGroupBoxStyle {
    static func coloredStoke(_ color: Color) -> Self {
        ColoredStrokeGroupBoxStyle(color: color)
    }
}

#Preview {
    NavigationStack {
        BoxesView()
    }
}
