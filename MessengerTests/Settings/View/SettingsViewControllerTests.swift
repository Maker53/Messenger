//  Created by Stanislav Shalgin on 21.09.2023.

import XCTest
@testable import Messenger

final class SettingsViewControllerTests: XCTestCase {
    var viewController: SettingsViewController!

    override func setUpWithError() throws {
        try super.setUpWithError()

        viewController = SettingsViewController()
    }

    override func tearDownWithError() throws {
        viewController = nil

        try super.tearDownWithError()
    }

    func testLoadView() {
        // when
        viewController.loadViewIfNeeded()
        // then
        let contentView: DisplaysSettingsView? = Mirror.reflectProperty(of: viewController!, name: "contentView")

        XCTAssertNotNil(contentView, "Should setup contentView")
    }
}
