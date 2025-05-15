//
//  RootView.swift
//  DataFlow
//
//  Created by Michael Skiba on 11/05/2025.
//

import SwiftUI

struct RootView: View {
    @State private var rootModel = RootViewModel()

    var body: some View {
        NavigationStack {
            Form {
                attendeesSection
                roomSection
                notesSection
            }
            .navigationTitle(Text("Session Info"))
            .sheet(isPresented: $rootModel.presentDetails) {
                NotesView(viewModel: rootModel.notesViewModel)
            }
        }
    }
}

private extension RootView {
    var attendeesSection: some View {
        return Section("Attendees") {
            CounterView(
                label: "\(rootModel.numberOfAttendees) attendees",
                count: $rootModel.numberOfAttendees
            )
            CounterView(
                label: "\(rootModel.numberOfPresenters) presenters",
                count: $rootModel.numberOfPresenters
            )
        }
    }

    var roomSection: some View {
        Section("Room") {
            Toggle("Has Wifi", isOn: $rootModel.hasWifi)
            Toggle("Has power strips", isOn: $rootModel.hasPowerStrips)
        }
    }

    var notesSection: some View {
        Section("Notes") {
            let hasNotes = !rootModel.notesViewModel.notes.isEmpty
            if hasNotes {
                Text(rootModel.notesViewModel.notes)
            }
            if let rating = rootModel.notesViewModel.rating {
                LabeledContent("Rating") {
                    RatingView(rating: rating)
                }
            }
            Button(hasNotes ? "Edit notes" : "Add notes") {
                rootModel.presentDetails = true
            }
        }
    }
}

#Preview {
    RootView()
}
