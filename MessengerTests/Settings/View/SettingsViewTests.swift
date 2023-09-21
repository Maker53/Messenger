//  Created by Stanislav Shalgin on 21.09.2023.

import XCTest
@testable import Messenger

final class SettingsViewTests: XCTestCase {
    var view: SettingsView!

    override func setUpWithError() throws {
        try super.setUpWithError()

        view = SettingsView(barHeight: TestData.barHeight)
    }

    override func tearDownWithError() throws {
        view = nil

        try super.tearDownWithError()
    }

    func testInit() {
        // then
        let tableView: UITableView! = Mirror.reflectProperty(of: view!, name: "tableView")

        XCTAssert(view.backgroundColor == TestData.backgroundColor)
        XCTAssert(tableView.backgroundColor == TestData.backgroundColor)
        XCTAssert(tableView.tableHeaderView is SettingsHeaderView)
        XCTAssert(tableView.contentInsetAdjustmentBehavior == TestData.contentInsetAdjustmentBehavior)
        XCTAssertFalse(tableView.translatesAutoresizingMaskIntoConstraints)
    }
}

// MARK: - TestData

private extension SettingsViewTests {
    enum TestData {
        static let barHeight: CGFloat = 10.0
        static let backgroundColor = Color.backgroundColorPrimary
        static let contentInsetAdjustmentBehavior: UIScrollView.ContentInsetAdjustmentBehavior = .never
    }
}
