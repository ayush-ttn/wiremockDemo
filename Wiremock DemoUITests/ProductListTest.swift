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
    func testProucts() async throws {
//        let username = "user_001"
//        let password = "Qwerty@123"
        
        let username = "bleveragei"
        let password = "UZGAiqPqWQHQ"
        
        DispatchQueue.main.async {
            let app = XCUIApplication()
            app.launch()

            self.login(app: app, username: username, password: password)
            
            self.waitforInstance(app: app)

            sleep(5)
            
            XCTAssertTrue(app.tables.cells.count > 0)
        }
    }
    func login(app: XCUIApplication, username: String, password: String) {
        let usernameTextfield = app.textFields["username"]
        usernameTextfield.tap()
        usernameTextfield.typeText(username)
        
        let passwordTextField = app.secureTextFields["password"]
        passwordTextField.tap()
        passwordTextField.typeText(password)
        
        let submitBtn = app.buttons["submit"]
        submitBtn.tap()
    }
    @discardableResult
    func waitforInstance(app: XCUIApplication) -> Bool {
        // checking for nav bar image and not scan bar button, since scan button can be hidden when the screen is swiped up.
        let navTitle = app.navigationBars
            .staticTexts["Products"]
        return navTitle.waitForExistence(timeout: 2)
    }
}
