//  Created by Станислав on 18.09.2023.

import XCTest
@testable import Messenger

final class AppDelegateTests: XCTestCase {
    var appDelegate: AppDelegate!

    override func setUp() {
        super.setUp()

        appDelegate = AppDelegate()
    }

    override func tearDown() {
        appDelegate = nil

        super.tearDown()
    }

    // MARK: - didFinishLaunchingWithOptions

    func testShouldSetupWindow() {
        // when
        let result = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        // then
        XCTAssertTrue(result, "Should return true")
        guard let window = appDelegate.window else {
            XCTFail("Window is not set")
            return
        }
        XCTAssertTrue(window.frame == window.screen.bounds, "Should setup correct frame")
        XCTAssertTrue(!window.isHidden, "Should show window on screen")
    }
}
