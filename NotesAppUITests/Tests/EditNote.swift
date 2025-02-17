/**
 В тесте проверяется редактирование заметки
 Шаги:
 1. Тапаем по созданной заметке
 2. Редактируем поле заголовока
 3. Редактируем поле описания
 4. Нажимаем на кнопку "Save"
 5. Проверяем, что заметка содержит отредактированные заголовок и описание
 */

import XCTest
@testable import notesApp

final class EditNote: XCTestCase {
    
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
        app.launch()
    }
    
    
    func testEditNot() throws {
        
        //Тапаем по созданной заметке
        listItems.tapOnItemInList()
        
        //Редактируем поле заголовока
        newNoteView.editTitleField()
        
        //Редактируем поле описания
        newNoteView.editDescriptionField()
        
        //Нажимаем на кнопку "Save"
        newNoteView.tapOnSaveButton()
        
        // Проверяем, что заметка содержит отредактированный заголовок
        let noteTitle = app.staticTexts[TestConstants.titleAfterEditNote]
        XCTAssertTrue(noteTitle.exists, "Заголовок заметки не соответствует введенному тексту")
        
        //Проверяем, что заметка содержит отредактированное описание
        let noteDescripton = app.staticTexts[TestConstants.descriptionAfterEditNote]
        XCTAssertTrue(noteDescripton.exists, "Описание заметки не соответствует введенному тексту")
        
    }
}
