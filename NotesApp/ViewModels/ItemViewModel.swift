import Foundation

class ItemViewModel: ObservableObject{
    var id: String? = nil
    @Published var title = ""
    @Published var description = ""
    @Published var schowAlert = false
    
    public init(item:  NoteListItem? = nil) {
        if let item {
            id = item.id
            title = item.title
            description = item.description
        }
    }
    
    func save(saveToPersistant: (NoteListItem) -> ()) {
        guard canSave else {
            return
        }
        
        let newId = id ?? UUID().uuidString
        let item = NoteListItem(
            
            id: newId,
            title: title,
            description: description,

            isDone: false
        )
       saveToPersistant(item)
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard !description.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        return true
    }
}
