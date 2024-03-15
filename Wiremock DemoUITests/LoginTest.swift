//
//  LoginTest.swift
//  Wiremock DemoUITests
//
//  Created by Ayush Awasthi on 15/03/24.
//

import XCTest

final class LoginTest: XCTestCase {

    func testLogin() async throws {
//        let username = "user_001"
//        let password = "Qwerty@123"
        
        let username = "bleveragei"
        let password = "UZGAiqPqWQHQ"

        DispatchQueue.main.async {
            let app = XCUIApplication()
            app.launch()

            let usernameTextfield = app.textFields["username"]
            usernameTextfield.tap()
            usernameTextfield.typeText(username)
            
            let passwordTextField = app.secureTextFields["password"]
            passwordTextField.tap()
            passwordTextField.typeText(password)
            
            let submitBtn = app.buttons["submit"]
            submitBtn.tap()
                        
            XCTAssertTrue(self.waitforInstance(app: app))
        }
    }
        
    func testLogin_Failed() async throws {
        let username = "wrong_username"
        let password = "wrong_password"
                
        DispatchQueue.main.async {
            let app = XCUIApplication()
            app.launch()

            let usernameTextfield = app.textFields["username"]
            usernameTextfield.tap()
            usernameTextfield.typeText(username)
            
            let passwordTextField = app.secureTextFields["password"]
            passwordTextField.tap()
            passwordTextField.typeText(password)
            
            let submitBtn = app.buttons["submit"]
            submitBtn.tap()
                        
            self.waitForElementToAppear(app.alerts.buttons["OK"], file: #file, line: #line, elementName: "OK button")
            
            XCTAssertTrue(app.alerts.buttons["OK"].exists)
        }
    }
    
    func waitforInstance(app: XCUIApplication) -> Bool {
        // checking for nav bar image and not scan bar button, since scan button can be hidden when the screen is swiped up.
        let navTitle = app.navigationBars
            .staticTexts["Products"]
        return navTitle.waitForExistence(timeout: 60)
    }
}
