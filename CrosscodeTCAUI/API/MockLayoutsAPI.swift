import Dependencies
import CrosscodeDataLibrary

struct MockLayoutsAPI: LayoutsAPI {
    @Dependency(\.uuid) var uuid
    
    var levels: [any Level] = []
    
    init() {
       levels = [
                Layout(
                    id: uuid(),
                    number: 1,
                    gridText: "--|--"
                )
            ]
    }

    func populateCrossword(crosswordLayout: String) async throws -> (String, String) {
        fatalError("\(#function) not implemented")
    }
    
    func depopulateCrossword(crosswordLayout: String) async throws -> (String, String) {
        fatalError("\(#function) not implemented")
    }
    
    func addNewLayout() async throws {
        fatalError("\(#function) not implemented")
    }
    
    func importLevels() async throws {
        fatalError("\(#function) not implemented")
    }
    
    func fetchLevel(id: UUID) async throws -> (any Level)? {
        fatalError("\(#function) not implemented")
    }
    
    func fetchAllLevels() async throws -> [any Level] {
        return levels
    }
    
    func deleteLevel(id: UUID) async throws -> [any Level] {
        fatalError("\(#function) not implemented")
    }
    
    func saveLevel(level: any Level) async throws {
        fatalError("\(#function) not implemented")
    }
    
    func cancel() async {
        fatalError("\(#function) not implemented")
    }
    
    func printTest() {
        fatalError("\(#function) not implemented")
    }
}
