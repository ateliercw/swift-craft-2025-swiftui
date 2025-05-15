//
//  NotesView.swift
//  DataFlow
//
//  Created by Michael Skiba on 11/05/2025.
//

import SwiftUI

struct NotesView: View {
    @Bindable var viewModel: NotesViewModel
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            Form {
                Section("Notes") {
                    TextEditor(text: $viewModel.notes)
                        .frame(minHeight: 200)
                }
                Section {
                    Picker("Rating", selection: $viewModel.rating) {
                        Text("None")
                            .tag(Int?.none)
                        ForEach(1...5, id: \.self) { rating in
                            RatingView(rating: rating)
                                .tag(Int?(rating))
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button("Done") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    @Previewable let notes = NotesViewModel()

    NotesView(viewModel: notes)
}
