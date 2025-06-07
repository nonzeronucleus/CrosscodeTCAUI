import ComposableArchitecture
import CrosscodeDataLibrary

@Reducer
struct LevelLayoutsListFeature {
    @Dependency(\.uuid) var uuid  

    @ObservableState
    struct State: Equatable {
        var levelLayouts: [LevelLayout] = []
    }
    
    enum Action {
        case addLayout(AddLayout)
        enum AddLayout {
            case start
            case success
            case failure(Error)
        }
        
        case fetchAll(FetchAll)
        enum FetchAll {
            case start
            case success([LevelLayout])
            case failure(Error)
        }
    }
    
    
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
                case .addLayout(let subAction):
                    return handleAddLayout(&state, action: subAction)
                case .fetchAll(let subAction):
                    return handleFetchAll(&state, action: subAction)
            }
        }
    }
}



extension LevelLayoutsListFeature {
    func handleAddLayout(_ state: inout State, action:Action.AddLayout) -> Effect<Action> {
        switch action {
            case .start:
                return addLayout(&state)
                
            case .success:
                return handleAddLayoutSuccess(&state)
                
            case .failure(let error):
                debugPrint("Error: \(error)")
                return .none
        }
    }
    
    func addLayout(_ state: inout State) -> Effect<Action> {
        @Dependency(\.apiClient) var apiClient
        return .run { send in
            do {
                try await apiClient.layoutsAPI.addNewLayout()
                
                await send(.addLayout(.success))
            }
            catch {
                await send(.fetchAll(.failure(error)))
            }
        }
    }
    
    func handleAddLayoutSuccess(_ state: inout State) -> Effect<Action> {
        .send(Action.fetchAll(.start))
    }
}





extension LevelLayoutsListFeature {
    func handleFetchAll(_ state: inout State, action:Action.FetchAll) -> Effect<Action> {
        switch action {
            case .start:
                return fetchAll(&state)
                
            case .success(let layouts):
                state.levelLayouts = layouts
                return .none
                
            case .failure(let error):
                debugPrint("Error: \(error)")
                return .none
        }
    }
    
    func fetchAll(_ state: inout State) -> Effect<Action> {
        @Dependency(\.apiClient) var apiClient
        return .run { send in
            do {
                let result = try await apiClient.layoutsAPI.fetchAllLevels() as! [LevelLayout]
                
                await send(.fetchAll(.success(result)))
//                debugPrint(result)
            }
            catch {
                await send(.fetchAll(.failure(error)))
            }
        }
    }
}

