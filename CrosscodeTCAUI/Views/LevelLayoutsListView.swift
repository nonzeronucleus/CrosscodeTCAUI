import SwiftUI
import ComposableArchitecture
import CrosscodeDataLibrary

struct LevelLayoutsListView: View {
    let store: StoreOf<LevelLayoutsListFeature>
    
    var body: some View {
        VStack {
            ForEach(store.levelLayouts, id: \.self) { level in
                Text("\(level.id)")
                    .onTapGesture {
                        //                        store.send(.didSelectLevel(level))
                    }
            }

                
            
        }
        .onAppear {
//            store.send(LevelLayoutsListFeature.Action.addLayout(.start))
            store.send(LevelLayoutsListFeature.Action.fetchAll(.start))
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
        LevelLayoutsListFeature()
    } withDependencies: {
        $0.uuid = .incrementing
        $0.apiClient = mock
    }
    
    LevelLayoutsListView(store: store)
}
