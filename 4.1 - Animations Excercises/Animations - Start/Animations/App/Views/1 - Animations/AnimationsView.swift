//
//  AnimationsView.swift
//  Animations
//
//  Created by Michael Skiba on 15/05/2025.
//

import SwiftUI

struct AnimationsView: View {
    @State private var explicitToggle = false
    @State private var implicitToggle = false
    @State private var matchToggle = false
    @State private var transitionToggle = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Explicit Animations")
                    .font(.title3)
                ExplicitAnimationView(toggled: $implicitToggle)
                    .padding(.bottom, 20)

                Text("Implicit Animations")
                    .font(.title3)
                ImplicitAnimationView(toggled: $explicitToggle)
                    .padding(.bottom, 20)

                Text("Match move Animations")
                    .font(.title3)
                MatchMoveAnimationView(toggled: $matchToggle)
                    .padding(.bottom, 20)

                Text("Transitions")
                    .font(.title3)
                TransitionsView(toggled: $transitionToggle)
                    .padding(.bottom, 20)

                Button("Toggle all") {
                    explicitToggle.toggle()
                    implicitToggle.toggle()
                    matchToggle.toggle()
                    transitionToggle.toggle()
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
        .navigationTitle("Animations")
    }
}

private struct ExplicitAnimationView: View {
    @Binding var toggled: Bool

    var body: some View {
        VStack(alignment: .leading) {
            Circle()
                .stroke(Color.black, lineWidth: 2)
                .fill(.red)
                .frame(width: 40)

            Button("Toggle") {
                toggled.toggle()
            }
        }
    }
}

private struct ImplicitAnimationView: View {
    @Binding var toggled: Bool

    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .circular)
                .stroke(Color.black, lineWidth: 2)
                .fill(.red)
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 40)

            Button("Toggle") {
                toggled.toggle()
            }
        }
    }
}

private struct MatchMoveAnimationView: View {
    @Binding var toggled: Bool
    @Namespace var matchMoveNamespace
    private let shapeId = 1

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if !toggled {
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                        .fill(.red)
                }
                Spacer()

                if toggled {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 2)
                        .fill(.green)
                        .aspectRatio(1, contentMode: .fit)
                }
            }
            .frame(height: 40)

            Button("Toggle") {
                toggled.toggle()
            }
        }
    }
}

private struct TransitionsView: View {
    @Binding var toggled: Bool

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                if !toggled {
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                        .fill(.red)
                        .frame(width: 40)
                }
                Spacer()
                if toggled {
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                        .fill(.blue)
                        .frame(width: 40)
                }
            }

            Button("Toggle") {
                    toggled.toggle()
            }
        }
    }
}

#Preview {
    NavigationStack {
        AnimationsView()
    }
}
