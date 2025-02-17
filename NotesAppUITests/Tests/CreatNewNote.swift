/**
 В тесте проверяется успешное создание новой заметки
 Шаги:
 1. Нажимаем на кнопку добавления новой заметки
 2. Заполняем поле заголовока
 3. Заполняем поле описания
 4. Нажимаем на кнопку "Save"
 5. Проверяем, что созданная заметка содержит введенные заголовок и описание
 */
 
import XCTest
@testable import notesApp

final class CreatNewNote: XCTestCase {
    
    var app: XCUIApplication!
    var newNoteView: NewNoteView!
    var listItems: ListItems!

    override func setUpWithError() throws {
        
        continueAfterFailure = false
    }

    override func setUp() {
        newNoteView = NewNoteView()
        listItems = ListItems()
        app = XCUIApplication()
        app.launchEnvironment.updateValue("YES", forKey: "UITesting")
        app.launchEnvironment.updateValue("YES", forKey: "UseEmptyList")
        app.launch()
    }
        
    
    func testCreatNewNot() throws {
       
        //Нажимаем на кнопку добавления новой заметки
        listItems.tapOnButtonPlus()
        
        //Заполняем поле заголовока
        newNoteView.fillTitleField()
        
        //Заполняем поле описания
        newNoteView.fillDescriptionField()
        
        //Нажимаем на кнопку "Save"
        newNoteView.tapOnSaveButton()
        
        // Проверяем, что созданная заметка содержит введенный заголовок
        let noteTitle = app.staticTexts[TestConstants.textForTestTitle]
        XCTAssertTrue(noteTitle.exists, "Заголовок заметки не соответствует введенному тексту")
        
        //Проверяем, что созданная заметка содержит введенныое описание
        let noteDescripton = app.staticTexts[TestConstants.textForTestDescription]
        XCTAssertTrue(noteDescripton.exists, "Описание заметки не соответствует введенному тексту")
    }
}
