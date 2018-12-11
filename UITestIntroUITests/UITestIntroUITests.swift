//
//  UITestIntroUITests.swift
//  UITestIntroUITests
//
//  Copyright © 2018年 hormiga6. All rights reserved.
//

import XCTest

class UITestIntroUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
    }
    
    func testPredicate(){
        let app = XCUIApplication()
        XCTAssertTrue(NSPredicate(format: "exists == 1").evaluate(with: app.buttons["table"]))
        XCTAssertTrue(NSPredicate(format: "exists == 1").evaluate(with: app.buttons["webview"]))
        XCTAssertTrue(NSPredicate(format: "exists == 0").evaluate(with: app.buttons["fuga"]))
    }
}
