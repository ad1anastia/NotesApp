/**
 В тесте проверяется, отображение алерта, при попытке создать заметку с пустым заголовком и описанием
 Шаги:
 1. Нажимаем на кнопку добавления новой заметки
 2. Нажимаем на кнопку "Save"
 3. Проверяем, что отобразился алерт об ошибке
 */

import XCTest

final class AllFieldsEmpty: XCTestCase {
    
    var app: XCUIApplication!
    var listItems: ListItems!
    var newNoteView: NewNoteView!
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
    }
    
    override func setUp() {
        newNoteView = NewNoteView()
        app = XCUIApplication()
        app.launch()
        
        listItems = ListItems()
    }
    
    func testEmptyFieldsAlert() throws {
        //Нажимаем на кнопку добавления новой заметки
        listItems.tapOnButtonPlus()
        
        //Нажимаем на кнопку "Save"
        newNoteView.tapOnSaveButton()
        
        let alert = app.alerts["Error"]
        
        // Проверяем, что алерт существует и видим
        XCTAssertTrue(alert.exists, "Проверяем, что отобразился алерт об ошибке, при сохранении заметки с пустыми полями")
    }
}
