/**
 В тесте проверяется удаление заметки
 Шаги:
 1. Свайпаем влево уже созданную заметку
 2. Нажимаем на кнопку "Delete"
 3. Проверяем, что заметка удалилась из списка
 4. На  пустом экране спика заметок,  отобразилась заглушка
 */

import XCTest
@testable import notesApp

final class DeleteNote: XCTestCase {
    
    var app: XCUIApplication!
    var listItems: ListItems!
    
    override func setUpWithError() throws {
        
        continueAfterFailure = false
    }
    
    override func setUp() {
        app = XCUIApplication()
        app.launchEnvironment.updateValue("YES", forKey: "UITesting")
        app.launch()
        
        listItems = ListItems()
    }
    
    func testDeleteNote() throws {
        
        let noteTitle = app.staticTexts[TestConstants.titleForMock]
        
        //Свайпаем влево уже созданную заметку
        listItems.swipeLeftNote()
        
        //Нажимаем на кнопку "Delete"
        listItems.deleteNote()
    
        //Проверяем, что заметка удалилась из списка
        XCTAssertFalse(noteTitle.exists, "Заметка должна быть удалена")

              
        // На  пустом экране спика заметок, отобразилась заглушка
        let placeholderImage = app.images["placeholder"]
        XCTAssertTrue(placeholderImage.exists, "Изображение заглушка должно существовать при пустом списке")
        XCTAssertTrue(placeholderImage.isHittable, "Изображение заглушка должно быть видимо на экране")
        
    }
}
