//
//  practiceUITests.swift
//  practiceUITests
//
//  Created by Nicholas Homayouni on 10/7/24.
//

import XCTest

final class practiceUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testButtonUpdatesLabel() throws {
        let app = XCUIApplication() // launch app
        app.launch()
        
        let button = app.buttons["updateButton"] // access initial state of button and label
        let label = app.staticTexts["statusLabel"]
        
        XCTAssertEqual(label.label, "Initial Text", "The label should start with 'Initial Text'") // check initial state of label
        
        button.tap() // tap button
        
        XCTAssertEqual(label.label, "Updated Text", "The label should change to 'Updated Text' after button tap") // verify label text has updated
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
