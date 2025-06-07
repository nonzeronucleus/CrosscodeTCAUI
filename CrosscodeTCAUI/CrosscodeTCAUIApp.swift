import SwiftUI
import ComposableArchitecture

@main
struct CrosscodeTCAUIApp: App {
    let store = Store(initialState: LevelLayoutsListFeature.State()) {
        LevelLayoutsListFeature()
    }
    
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
