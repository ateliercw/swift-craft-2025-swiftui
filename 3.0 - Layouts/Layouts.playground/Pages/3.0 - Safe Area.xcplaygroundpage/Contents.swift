//: [Previous](@previous)

/*: # Safe Area
 
 The `Safe Area` is represented by those parts of the screen which are reserved by iOS for its own Views which permeate every application: clock, battery level, dynamic island, WI-FI and cellular level (at the top) and gesture drag handle (at the bottom).
 
 The same principles for interacting with the Safe Area hold in SwiftUI as well: you will respect it whenever you layout views, unless you explicitly **opt out** of it.
 
 However, SwiftUI solved a decade old pain for which we had numerous frameworks to work around it: avoiding the keyboard ~ since that is considered one of the safe area regions too. Furthermore, you can now define your own safe area or alter the existing safe area that all the other subviews will respect.
 
 ```
 func safeAreaInset<V>(edge:,alignment:,spacing:,content:) -> some View
 func safeAreaPadding(_:) -> some View
 ```
 What is cool about this API is that you can declare multiple insets which will stack up on each other.
 
 While you can achieve the same effects without using this API, you will not get the same behaviour with respect to the other Safe Area modifiers, like: `.ignoresSafeArea(_:edges:)`.
 */

import SwiftUI
import PlaygroundSupport

struct DashboardView: View {
    
    private enum Tab: String, Identifiable, CaseIterable {
        case home, workshops, talks
        
        var id: String {
            rawValue
        }
        
        var systemIconName: String {
            switch self {
            case .home:
                "house"
                
            case .workshops:
                "hammer"
                
            case .talks:
                "person.wave.2"
            }
        }
        
        var title: LocalizedStringKey {
            LocalizedStringKey(rawValue.capitalized)
        }
    }
    
    @State private var selectedTab = Tab.home
    
    var body: some View {
        ZStack {
            ForEach(Tab.allCases) { tab in
                Group {
                    switch tab {
                    case .home:
                        Color.yellow
                        
                    case .workshops:
                        Color.green
                        
                    case .talks:
                        Color.orange
                    }
                }
                .overlay {
                    Text(tab.title)
                }
                .opacity(selectedTab == tab ? 1.0 : 0.0)
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack(spacing: .zero) {
                ForEach(Tab.allCases) { tab in
                    Button {
                        selectedTab = tab
                    } label: {
                        VStack(spacing: 8.0) {
                            Image(systemName: tab.systemIconName)
                            Text(tab.title)
                        }
                        .padding()
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .background(.clear)
            .ignoresSafeArea(.keyboard, edges: .bottom)
        }
    }
}

PlaygroundPage.current.setLiveView(
    DashboardView()
        .frame(width: 402, height: 874)
)

struct MyKeyboardAvoidingView: View {
    
    @State private var query = ""
    
    var body: some View {
        ScrollView {
            VStack {
                Color.red.frame(height: 1000)
                    .overlay {
                        TextField("Type anything", text: $query)
                            .padding()
                            .textFieldStyle(.roundedBorder)
                    }
                Color.teal.frame(height: 1000)
                Color.red.frame(height: 1000)
            }
        }
        .scrollDismissesKeyboard(.immediately)
        // 💡 What happens if we replace this this .safeAreaInset?
        .overlay(alignment: .bottom) {
            Button("Submit") { }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.blue)
                .clipShape(.capsule)
                .foregroundStyle(.black)
                .padding()
        }
    }
}

PlaygroundPage.current.setLiveView(
    MyKeyboardAvoidingView()
        .frame(width: 402, height: 874)
)

//: [Next](@next)
