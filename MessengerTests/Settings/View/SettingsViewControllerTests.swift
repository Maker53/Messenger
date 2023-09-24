//  Created by Stanislav Shalgin on 21.09.2023.

import XCTest
@testable import Messenger

final class SettingsViewControllerTests: XCTestCase {
    var viewController: SettingsViewController!
    var tableManagerMock: ManagesSettingsTableMock!
    var contentViewMock: DisplaysSettingsViewMock!

    override func setUp() {
        super.setUp()

        tableManagerMock = ManagesSettingsTableMock()
        contentViewMock = DisplaysSettingsViewMock()
        viewController = SettingsViewController(tableManager: tableManagerMock)
    }

    override func tearDown() {
        tableManagerMock = nil
        contentViewMock = nil
        viewController = nil

        super.tearDown()
    }
    
    // MARK: - loadView

    func testLoadView() {
        // when
        viewController.loadViewIfNeeded()
        // then
        let contentView = viewController.contentView

        XCTAssertNotNil(contentView, "Should setup contentView")
    }
    
    // MARK: - viewDidLoad
    
    func testConfigureTableView() {
        // given
        viewController.contentView = contentViewMock
        // when
        viewController.viewDidLoad()
        // then
        XCTAssertEqual(contentViewMock.configureTableViewWasCalled, 1)
        XCTAssertIdentical(contentViewMock.configureTableViewReceivedManager, tableManagerMock)
    }
}
