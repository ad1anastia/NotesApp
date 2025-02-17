import XCTest
import Foundation

public class NewNoteView {

    @Published var app = XCUIApplication()
    
    func fillTitleField() {
        let titleField = app.textViews["title"]
        titleField.tap()
        titleField.typeText(TestConstants.textForTestTitle)
    }
    
    func editTitleField() {
        let titleField = app.textViews[TestConstants.titleForMock]
        titleField.tap()
        titleField.typeText(TestConstants.textForEditTest)
    }
    
    func fillDescriptionField() {
        let descriprionField = app.textViews["description"]
        descriprionField.tap()
        descriprionField.typeText(TestConstants.textForTestDescription)
    }
    
    func editDescriptionField() {
        let descriprionField = app.textViews[TestConstants.descriptionForMock]
        descriprionField.tap()
        descriprionField.typeText(TestConstants.textForEditTest)
    }
    
    func tapOnSaveButton() {
        let buttonSave = app.buttons["Save"]
        buttonSave.tap()
    }
}
