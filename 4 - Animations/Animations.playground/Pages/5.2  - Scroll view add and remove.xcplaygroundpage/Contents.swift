//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

/*:

 ## Responding to views being added / removed

 Scroll transitions are an easy was to animate a change to a view when it's added or removed from the visible area of the scroll view. It handles all of the logic and you only provide it the transform effect to apply in the closure for the transition. You also can specify if the transition is animated, interactive, or not animated in the configuration.
 */

struct ScrollTransitionsView: View {
    @State private var text = ""
    @State private var showSquare = false

    var body: some View {
        ScrollView {
            VStack {
                Text("Top")
                    .padding(.horizontal)
                    .background {
                        Capsule()
                            .fill(.background.secondary)
                            .stroke(.secondary)
                    }

                    .scrollTransition(.interactive) { effect, phase  in
                        switch phase {
                        case .bottomTrailing, .identity:
                            effect.opacity(1)
                        case .topLeading:
                            effect.opacity(0)
                        }
                    }
                Spacer()
                Text("Bottom")
                    .padding(.horizontal)
                    .background {
                        Capsule()
                            .fill(.background.secondary)
                            .stroke(.secondary)
                    }
                    .scrollTransition(.animated) { effect, phase  in
                        switch phase {
                        case .topLeading, .identity:
                            effect.opacity(1)
                        case .bottomTrailing:
                            effect.opacity(0)
                        }
                    }
            }
            .padding()
            .frame(height: 700)
            .frame(maxWidth: .infinity)
        }
        .frame(width: 300, height: 600)
    }
}

PlaygroundPage.current.setLiveView(ScrollTransitionsView())

/*:

If we want to start or stop work as views become visible, on options is to use .onScrollVisibilityChanged

 */

@Observable
class BusyViewModel: Identifiable {
    let id: UUID
    var isBusy: Bool = false

    init(id: UUID = UUID(), isBusy: Bool) {
        self.id = id
        self.isBusy = isBusy
    }
}

struct AddRemoveTrackerView: View {
    @State private var models = (0..<100).map { _ in
        BusyViewModel(isBusy: false)
    }

    var body: some View {
        ScrollView {
            VStack {
                ForEach(models) { model in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.background.secondary)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                        .onScrollVisibilityChange { visible in
                            model.isBusy = visible
                        }
                }
            }
            .padding()
        }
        .safeAreaInset(edge: .bottom) {
            Text("\(models.count(where: \.isBusy)) models are busy")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.thinMaterial)
        }
        .frame(width: 300, height: 600)
    }
}

PlaygroundPage.current.setLiveView(AddRemoveTrackerView())

/*:

If you want to manage all of the updates in one place, you can use `onScrollTargetVisibilityChange` along with a `scrollTargetLayout` applied to the container that holds the views you'd like to react to.

 */

struct AlternateAddRemoveTrackerView: View {
    @State private var models = (0..<100).map { _ in
        BusyViewModel(isBusy: false)
    }

    var body: some View {
        ScrollView {
            VStack {
                ForEach(models) { model in
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.background.secondary)
                        .frame(height: 40)
                        .frame(maxWidth: .infinity)
                }
            }
            .padding()
            .scrollTargetLayout()
        }
        .onScrollTargetVisibilityChange(idType: BusyViewModel.ID.self) { ids in
            for model in models {
                model.isBusy = ids.contains(model.id)
            }
        }
        .safeAreaInset(edge: .bottom) {
            Text("\(models.count(where: \.isBusy)) models are busy")
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(.thinMaterial)
        }
        .frame(width: 300, height: 600)
    }
}

PlaygroundPage.current.setLiveView(AlternateAddRemoveTrackerView())

//: [Next](@next)
