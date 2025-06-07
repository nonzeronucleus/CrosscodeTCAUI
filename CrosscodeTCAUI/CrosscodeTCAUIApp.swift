import SwiftUI
import ComposableArchitecture

@main
struct CrosscodeTCAUIApp: App {
    let store = Store(initialState: LayoutsListFeature.State()) {
        LayoutsListFeature()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
