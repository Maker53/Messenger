//  Created by Stanislav Shalgin on 23.09.2023.

import XCTest
@testable import Messenger

final class SettingsTableManagerTests: XCTestCase {
    var tableManager: SettingsTableManager!
    var tableViewMock: UITableViewMock!

    override func setUp() {
        super.setUp()

        tableManager = SettingsTableManager()
        tableViewMock = UITableViewMock()
    }

    override func tearDown() {
        tableManager = nil

        super.tearDown()
    }
    
    // MARK: - numberOfRowsInSection

    func testNumberOfRowsInValidSection() {
        // when
        let result = tableManager.tableView(tableViewMock, numberOfRowsInSection: TestData.validIndexPath.section)
        // then
        XCTAssertEqual(result, 3)
    }
    
    func testNumberOfRowsInInvalidSection() {
        // when
        let result = tableManager.tableView(tableViewMock, numberOfRowsInSection: TestData.invalidIndexPath.section)
        // then
        XCTAssertEqual(result, 3)
    }
    
    // MARK: - viewForHeaderInSection
    
    func testViewForHeaderInValidSection() {
        // when
        let result = tableManager.tableView(tableViewMock, viewForHeaderInSection: TestData.validIndexPath.section)
        // then
        let tableHeaderView: SettingsHeaderView? = Mirror.reflectProperty(of: tableManager!, name: "tableHeaderView")
        XCTAssertNotNil(tableHeaderView)
        XCTAssertTrue(result is SettingsHeaderView)
    }
    
    func testViewForHeaderInInvalidSection() {
        // when
        let result = tableManager.tableView(tableViewMock, viewForHeaderInSection: TestData.invalidIndexPath.section)
        // then
        let tableHeaderView: SettingsHeaderView? = Mirror.reflectProperty(of: tableManager!, name: "tableHeaderView")
        XCTAssertNotNil(tableHeaderView)
        XCTAssertTrue(result is SettingsHeaderView)
    }
}

// MARK: - TestData

private extension SettingsTableManagerTests {
    enum TestData {
        static let validIndexPath = IndexPath(row: 0, section: 0)
        static let invalidIndexPath = IndexPath(row: 999, section: 999)
    }
}

