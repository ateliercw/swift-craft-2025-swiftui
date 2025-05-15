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
                .fill(toggled ? .blue : .red)
                .frame(width: 40)
                .frame(maxWidth: .infinity, alignment: toggled ? .trailing : .leading)

            Button("Toggle") {
                withAnimation(.interpolatingSpring) {
                    toggled.toggle()
                }
            }
        }
    }
}

private struct ImplicitAnimationView: View {
    @Binding var toggled: Bool
    @State private var task: Task<Void, Never>?

    var body: some View {
        VStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: toggled ? 0 : 20, style: .circular)
                .stroke(Color.black, lineWidth: 2)
                .fill(toggled ? .cyan : .red)
                .aspectRatio(1, contentMode: .fit)
                .frame(width: 40)
                .rotationEffect(toggled ? .degrees(90) : .degrees(0))
                .frame(maxWidth: .infinity, alignment: toggled ? .trailing : .leading)

            Button("Toggle") {
                toggled.toggle()
            }
        }
        .animation(.interpolatingSpring, value: toggled)
        .onChange(of: toggled) { _, update in
            task?.cancel()
            guard update == true else { return }
            task = Task { @MainActor in
                try? await Task.sleep(for: .seconds(2))
                guard Task.isCancelled == false else { return }
                toggled = false
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
                        .matchedGeometryEffect(id: shapeId, in: matchMoveNamespace)
                }
                Spacer()

                if toggled {
                    Rectangle()
                        .stroke(Color.black, lineWidth: 2)
                        .fill(.green)
                        .aspectRatio(1, contentMode: .fit)
                        .matchedGeometryEffect(id: shapeId, in: matchMoveNamespace)
                }
            }
            .frame(height: 40)
            .animation(.interpolatingSpring, value: toggled)

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
                        .transition(.scale)
                }
                Spacer()
                if toggled {
                    Circle()
                        .stroke(Color.black, lineWidth: 2)
                        .fill(.blue)
                        .frame(width: 40)
                        .transition(.scale)
                }
            }

            Button("Toggle") {
                withAnimation(.interpolatingSpring) {
                    toggled.toggle()
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        AnimationsView()
    }
}
