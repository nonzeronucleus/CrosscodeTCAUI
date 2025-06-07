import SwiftUI
import ComposableArchitecture
import CrosscodeDataLibrary

struct LayoutsListView: View {
    let store: StoreOf<LayoutsListFeature>
    
    var body: some View {
        VStack {
            ForEach(store.layouts, id: \.self) { level in
                Text("\(level.id)")
                    .onTapGesture {
                        //                        store.send(.didSelectLevel(level))
                    }
            }

                
            
        }
        .onAppear {
//            store.send(LayoutsListFeature.Action.addLayout(.start))
            store.send(LayoutsListFeature.Action.fetchAll(.start))
        }
    }
}

#Preview {
    let mock:APIClient = withDependencies {
        $0.uuid = UUIDGenerator.incrementing
    } operation: {
        .mock
    }

    let store = Store(initialState: .init()) {
        LayoutsListFeature()
    } withDependencies: {
        $0.uuid = .incrementing
        $0.apiClient = mock
    }
    
    LayoutsListView(store: store)
}
