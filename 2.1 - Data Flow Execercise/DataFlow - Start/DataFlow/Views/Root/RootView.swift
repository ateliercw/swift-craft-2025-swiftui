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
                Text("TODO: - Notes view")
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
            Text("Todo - Notes and rating here")
            Button("Show") {
                rootModel.presentDetails = true
            }
        }
    }
}

#Preview {
    RootView()
}
