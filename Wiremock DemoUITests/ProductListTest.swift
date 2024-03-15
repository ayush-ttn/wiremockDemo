//
//  ProductListTest.swift
//  Wiremock DemoUITests
//
//  Created by Ayush Awasthi on 15/03/24.
//

import XCTest

final class ProductListTest: XCTestCase {
    override class func setUp() {
        super.setUp()
    }
    func testProucts() throws {
        let app = XCUIApplication()
        app.launch()

        login(app: app)
        sleep(1)
        XCTAssertTrue(app.tables.cells.count > 0)
    }
    func login(app: XCUIApplication) {
        let usernameTextfield = app.textFields["username"]
        usernameTextfield.tap()
        usernameTextfield.typeText("atuny0")
        
        let passwordTextField = app.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText("9uQFF1Lh")
        
        let submitBtn = app.buttons["submit"]
        submitBtn.tap()
        
        waitforInstance(app: app)
    }
    @discardableResult
    func waitforInstance(app: XCUIApplication) -> Bool {
        // checking for nav bar image and not scan bar button, since scan button can be hidden when the screen is swiped up.
        let navTitle = app.navigationBars
            .staticTexts["Products"]
        return navTitle.waitForExistence(timeout: 2)
    }
}
