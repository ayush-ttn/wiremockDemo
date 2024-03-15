//
//  LoginTest.swift
//  Wiremock DemoUITests
//
//  Created by Ayush Awasthi on 15/03/24.
//

import XCTest

final class LoginTest: XCTestCase {

    func testLogin() throws {
        let app = XCUIApplication()
        app.launch()
        
        let usernameTextfield = app.textFields["username"]
        usernameTextfield.tap()
        usernameTextfield.typeText("atuny0")
        
        let passwordTextField = app.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("9uQFF1Lh")
        
        let submitBtn = app.buttons["submit"]
        submitBtn.tap()
        
        XCTAssertTrue(waitforInstance(app: app))
    }
    func waitforInstance(app: XCUIApplication) -> Bool {
        // checking for nav bar image and not scan bar button, since scan button can be hidden when the screen is swiped up.
        let navTitle = app.navigationBars
            .staticTexts["Products"]
        return navTitle.waitForExistence(timeout: 2)
    }
}
