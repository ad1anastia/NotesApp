import Foundation

public class PersistenceStore {

    static let store: PersistenceStorage = isTestsRunning ? MockStorage() : FilePersistenseStorage()
}

protocol PersistenceStorage {
    func saveToPersistenceStore(_ listItems: [NoteListItem])
    func loadFromPersistenceStore() -> [NoteListItem]
}

class FilePersistenseStorage: PersistenceStorage {
    
    // MARK: Persistence (сохранение в память телефона)
    func saveToPersistenceStore(_ listItems: [NoteListItem]) {
        do{
            let data = try JSONEncoder().encode(listItems)
            try data.write(to: createPersistenseStore())
        } catch{
            print("Error while saving")
        }
    }
    
    func loadFromPersistenceStore() -> [NoteListItem] {
        do {
            let data = try Data(contentsOf: createPersistenseStore())
            return try JSONDecoder().decode([NoteListItem].self, from: data)
        } catch {
            print("Error while saving")
        }
        
        return []
    }
    
    private func createPersistenseStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("ToDoList.json")
        return fileURL
    }
}

class MockStorage: PersistenceStorage {
    private var listItems: [NoteListItem] = ProcessInfo.processInfo.environment["UseEmptyList"] == "YES" ? []
    : [
        NoteListItem(id: "testid1", title: "Test Title 1", description: "Test Description 1", isDone: false),
    ]
    
    func saveToPersistenceStore(_ listItems: [NoteListItem]) {
        self.listItems = listItems
    }
    
    func loadFromPersistenceStore() -> [NoteListItem] {
        listItems
    }
}

var isTestsRunning: Bool {
#if DEBUG
    ProcessInfo.processInfo.environment["UITesting"] == "YES"
#else
    false
#endif
}
