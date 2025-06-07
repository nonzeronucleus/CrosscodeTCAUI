import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<LevelLayoutsListFeature>
    
    var body: some View {
        LevelLayoutsListView(store: store)
    }
}

//#Preview {
//    ContentView()
//}
