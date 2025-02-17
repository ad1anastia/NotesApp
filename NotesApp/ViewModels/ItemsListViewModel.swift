import Foundation

class ItemsListViewModel: ObservableObject{
    /// флаг для открытия экрана создания заметки
    @Published var showingNewItemView = false
    
    /// флаг для открытия экрана редактирования заметки
    @Published var showingEditItemView = false
    
    /// выбранная заметка для редактирования
    @Published var selectedItem: NoteListItem?
    
    /// замыкание для сохранения в хранилище
    @Published var saveToPersistant: (NoteListItem) -> () = { _ in }
    
    /// замыкание для редактирования элементов
    @Published var updateItem: (NoteListItem) -> () = { _ in }
    
    /// список заметок
    @Published var listItems : [NoteListItem] = []
    
    
    init() {
        saveToPersistant = { [weak self] item in
            guard let self else {
                return
            }
            listItems.append(item)
            PersistenceStore.store.saveToPersistenceStore(listItems)
        }
        
        updateItem = { [weak self] item in
            guard
                let self,
                let index = listItems.firstIndex(where: { $0.id == item.id })
            else { return }
            listItems[index] = item
            PersistenceStore.store.saveToPersistenceStore(listItems)
        }
        
        listItems = PersistenceStore.store.loadFromPersistenceStore()
    }
    
    func toggleIsCompleted(item : NoteListItem) {
        guard let index = listItems.firstIndex(of: item) else {return}
        listItems[index].isDone.toggle()
        PersistenceStore.store.saveToPersistenceStore(listItems)
    }
    
    func deleteItem(index: IndexSet) {
        listItems.remove(atOffsets: index)
        PersistenceStore.store.saveToPersistenceStore(listItems)
    }
}




