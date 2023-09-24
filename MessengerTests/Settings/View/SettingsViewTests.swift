//  Created by Stanislav Shalgin on 21.09.2023.

import XCTest
@testable import Messenger

final class SettingsViewTests: XCTestCase {
    var view: SettingsView!
    var tableManagerMock: ManagesSettingsTableMock!

    override func setUp() {
        super.setUp()

        view = SettingsView(barHeight: TestData.barHeight)
        tableManagerMock = ManagesSettingsTableMock()
    }

    override func tearDown() {
        view = nil
        tableManagerMock = nil

        super.tearDown()
    }

    func testInit() {
        // then
        let tableView: UITableView! = Mirror.reflectProperty(of: view!, name: "tableView")

        XCTAssert(view.backgroundColor == TestData.backgroundColor)
        XCTAssertEqual(tableView.style, .grouped)
        XCTAssert(tableView.backgroundColor == TestData.backgroundColor)
        XCTAssert(tableView.contentInsetAdjustmentBehavior == TestData.contentInsetAdjustmentBehavior)
        XCTAssertFalse(tableView.translatesAutoresizingMaskIntoConstraints)
    }
    
    // MARK: - configureTableView
    
    func testConfigureTableView() {
        // when
        view.configureTableView(tableManagerMock)
        // then
        let tableView: UITableView! = Mirror.reflectProperty(of: view!, name: "tableView")
        XCTAssertIdentical(tableView.dataSource, tableManagerMock)
        XCTAssertIdentical(tableView.delegate, tableManagerMock)
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
