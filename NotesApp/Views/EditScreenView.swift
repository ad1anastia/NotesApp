import SwiftUI

struct EditScreenView: View {
    
    @StateObject var viewModel = ItemViewModel()
    @Binding var saveToPersistant: (NoteListItem) -> ()
    @Binding var newItemPressented: Bool
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $viewModel.title)
                        .border(Color.black.opacity(0.5), width: 1)
                        .frame(height: 80)
                        .border(Color(uiColor: .opaqueSeparator), width: 0.5)
                    Text("Add title")
                        .fontWeight(.light)
                        .foregroundColor(.black.opacity(0.25))
                        .padding(8).hidden(!viewModel.title.isEmpty)
                }
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $viewModel.description)
                        .border(Color.gray.opacity(0.5), width: 1)
                        .frame(minHeight: 110) // Минимальная высота для текстового редактора
                        .foregroundColor(.gray)
                    
                    
                    Text("Add description")
                        .fontWeight(.light)
                        .foregroundColor(.black.opacity(0.25))
                        .padding(8).hidden(!viewModel.description.isEmpty)
                }
                
                Spacer() // Заполняет пространство, чтобы текстовые поля были в верхней части экрана
                
            }
            .alert(isPresented: $viewModel.schowAlert) {
                Alert(
                    title: Text("Error"),
                    message: Text ("Пожалуйста заполните все поля"))
            }
            .navigationBarTitle("Edit Note", displayMode: .inline) // Заголовок навигации
            .navigationBarItems(trailing: Button(action: {
                saveData()
            }) {
                Text("Save")
            })
            .padding()
        }
    }
    
    
    
    private func saveData() {
        if
            viewModel.canSave {
            viewModel.save(saveToPersistant: saveToPersistant)
            newItemPressented = false
            
        }
        else {
            viewModel.schowAlert = true
        }
    }
}
