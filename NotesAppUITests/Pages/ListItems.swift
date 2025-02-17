import XCTest
import Foundation

public class ListItems {
    @Published var app = XCUIApplication()
    
    func tapOnButtonPlus(){
        app.buttons["plus_button"].tap()
    }
    
    func swipeLeftNote(){
        let noteForSwipe = app.staticTexts[TestConstants.titleForMock]
        noteForSwipe.swipeLeft()
    }
    
    func deleteNote(){
        app.collectionViews.buttons["Delete"].tap()
    }
    
    func tapOnItemInList(){
        app.staticTexts[TestConstants.titleForMock].tap()
    }
}
