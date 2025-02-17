import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel: ItemsListViewModel
    var body: some View {
        NavigationView {
            ZStack {
                if viewModel.listItems.isEmpty {
                    Image("placeholder")
                        .resizable()
                        .scaledToFill()
                        .edgesIgnoringSafeArea(.all) // Игнорирование безопасных областей
                }
                else {
                    NoteList()
                }
                VStack {
                    Spacer()
                    HStack {
                        NewNoteButton()
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func NoteList() -> some View {
        List {
            ForEach(viewModel.listItems) { item in
                Button(action: {
                    viewModel.selectedItem = item
                    viewModel.showingEditItemView = true
                }) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(item.title)
                            .foregroundColor(.black)
                            .font(.headline)
                        Text(item.description)
                            .foregroundColor(.gray)
                            .font(.subheadline) 
                    }
                }
                
            }
            .onDelete(perform: viewModel.deleteItem(index:))
        }
        .sheet( isPresented: $viewModel.showingEditItemView ) {
            EditScreenView(
                viewModel: ItemViewModel(item: viewModel.selectedItem),
                saveToPersistant: $viewModel.updateItem,
                newItemPressented: $viewModel.showingEditItemView
            )
        }
        .listStyle(InsetGroupedListStyle()) // Задаем стиль для списка
        .navigationTitle("Список элементов")
    }
    
    
    @ViewBuilder
    func NewNoteButton() -> some View {
        Button(action: {
            viewModel.showingNewItemView = true
        }) {
            Spacer() // Заполнение пространства слева
            Image(systemName: "plus") // Иконка кнопки
                .resizable()
                .foregroundColor(.white) // Цвет иконки
                .accessibilityIdentifier("plus_button")
                .sheet( isPresented: $viewModel.showingNewItemView
                ){ NewScreenView( saveToPersistant: $viewModel.saveToPersistant,
                                  newItemPressented: $viewModel.showingNewItemView )
                }
                .scaledToFit()
                .frame(width: 24, height: 24) // Размер иконки
                .padding()
                .background(Color.pink) // Цвет фона кнопки
                .clipShape(Circle()) // Кнопка в форме круга
                .shadow(radius: 5) // Тень для кнопки
            
        }
        .padding() // Отступ для кнопки
        .padding()
    }
}
