/**
 В тесте проверяется, отображение алерта, при попытке создать заметку с пустым заголовком
 Шаги:
 1. Нажимаем на кнопку добавления новой заметки
 2. Заполняем поле описания заметки
 3. Нажимаем на кнопку "Save"
 4. Проверяем, что отобразился алерт об ошибке
 */

import XCTest

final class TitleFieldEmpty: XCTestCase {

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
    
    func testEmptyTitleAlert() throws {
      
        //Нажимаем на кнопку добавления новой заметки
        listItems.tapOnButtonPlus()
        
        //Заполняем поле описания заметки
        newNoteView.fillDescriptionField()
        
        //Нажимаем на кнопку "Save"
        newNoteView.tapOnSaveButton()
        
        //Проверяем, что отобразился алерт об ошибке
        let alert = app.alerts["Error"]
        XCTAssertTrue(alert.exists, "Проверяем отображение алерта, при сохранении заметки с пустым Title")
    }
}
