import Foundation

struct NoteListItem: Codable, Identifiable, Equatable {
    let id: String
    let title: String
    let description: String
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
