//  Created by Станислав on 18.09.2023.

import XCTest
@testable import Messenger

final class AppDelegateTests: XCTestCase {
    var appDelegate: AppDelegate!

    override func setUpWithError() throws {
        try super.setUpWithError()

        appDelegate = AppDelegate()
    }

    override func tearDownWithError() throws {
        appDelegate = nil

        try super.tearDownWithError()
    }

    func testDidFinishLaunchingWithOptions() {
        // when
        let result = appDelegate.application(UIApplication.shared, didFinishLaunchingWithOptions: nil)
        // then
        XCTAssertTrue(result, "Should return true")
        guard let window = appDelegate.window else {
            XCTFail("Window is not set")
            return
        }
        XCTAssertTrue(window.frame == window.screen.bounds, "Should setup correct frame")
        XCTAssertTrue(window.rootViewController is UINavigationController, "Should setup root controller")
        XCTAssertTrue(!window.isHidden, "Should show window on screen")
    }
}
