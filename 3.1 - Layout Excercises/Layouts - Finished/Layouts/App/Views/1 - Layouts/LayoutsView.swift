//
//  LayoutsView.swift
//  Layouts
//
//  Created by Michael Skiba on 13/05/2025.
//

import SwiftUI

struct LayoutsView: View {
    @State private var selectedLayout: TestLayout = .horizontal
    private let rowCount: Int = 12
    private let colCount: Int = 12
    private let scrollID = 0

    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(selectedLayout.axes) {
                layout {
                    colorViews
                }
                .id(scrollID)
            }
            .onChange(of: selectedLayout) {
                proxy.scrollTo(scrollID, anchor: .topLeading)
            }
        }
        .ignoresSafeArea(selectedLayout == .horizontal ? .all : [])
        .scrollBounceBehavior(.always, axes: selectedLayout.axes)
        .safeAreaInset(edge: .bottom) {
            layoutPicker
                .padding()
                .frame(maxWidth: .infinity)
                .background(.regularMaterial.shadow(.drop(radius: 1)))
        }
        .overlay(alignment: .top) {
            if selectedLayout == .horizontal {
                Rectangle()
                    .frame(height: 0)
                    .background(.regularMaterial.shadow(.drop(radius: 1)))
            }
        }
        .navigationTitle("Layouts")
    }
}

private extension LayoutsView {
    var layout: AnyLayout {
        switch selectedLayout {
        case .vertical:
            AnyLayout(VStackLayout(spacing: 0))
        case .horizontal:
            AnyLayout(HStackLayout(spacing: 0))
        case .grid:
            AnyLayout(GridLayout(horizontalSpacing: 0, verticalSpacing: 0))
        }
    }

    var layoutPicker: some View {
        Picker("Layout", selection: $selectedLayout) {
            ForEach(TestLayout.allCases) { layout in
                Text(layout.label)
            }
        }
        .pickerStyle(.segmented)
    }

    private var colorViews: some View {
        ForEach(Array(0..<rowCount), id: \.self) { row in
            GridRow {
                ForEach(Array(0..<colCount), id: \.self) { col in
                    Color.random
                        .frame(minWidth: 64, minHeight: 64)
                        .overlay {
                            switch selectedLayout {
                            case .grid:
                                Text("(\(row), \(col))")
                            case .horizontal, .vertical:
                                Text("\((row * colCount) + col)")
                            }
                        }
                }
            }
        }
    }

    enum TestLayout: Hashable, Identifiable, CaseIterable {
        var id: Self { self }
        case horizontal
        case vertical
        case grid

        var label: LocalizedStringKey {
            switch self {
            case .horizontal: "Horizontal"
            case .vertical: "Vertical"
            case .grid: "Grid"
            }
        }

        var axes: Axis.Set {
            switch self {
            case .grid:
                [.vertical, .horizontal]
            case .vertical:
                    .vertical
            case .horizontal:
                    .horizontal
            }
        }
    }
}

#Preview {
    NavigationStack {
        LayoutsView()
    }
}
