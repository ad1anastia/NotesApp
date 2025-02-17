/**
 В тесте проверяется, отображение алерта, при попытке создать заметку с пустым заголовком
 Шаги:
 1. Нажимаем на кнопку добавления новой заметки
 2. Заполняем поле заголовка заметки
 3. Нажимаем на кнопку "Save"
 4. Проверяем, что отобразился алерт об ошибке
 */

import XCTest

final class DescriptionFieldEmpty: XCTestCase {

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
    
    func testEmptyDescriptionAlert() throws {
        
        //Нажимаем на кнопку добавления новой заметки
        listItems.tapOnButtonPlus()
        
        //Заполняем поле заголовка заметки
        newNoteView.fillTitleField()
        
        //Нажимаем на кнопку "Save"
        newNoteView.tapOnSaveButton()
        
        //Проверяем, что отобразился алерт об ошибке
        let alert = app.alerts["Error"]
        XCTAssertTrue(alert.exists, "Проверяем отображение алерта, при сохранении заметки с пустым Description")
    }
}
