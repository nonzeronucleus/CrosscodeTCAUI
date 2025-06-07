import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<LayoutsListFeature>
    
    var body: some View {
        LayoutsListView(store: store)
    }
}

//#Preview {
//    ContentView()
//}
