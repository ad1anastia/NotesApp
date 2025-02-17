import SwiftUI

@main
struct NotesApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(viewModel: ItemsListViewModel())
        }
    }
}
