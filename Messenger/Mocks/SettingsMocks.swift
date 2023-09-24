//  Created by Stanislav Shalgin on 23.09.2023.

import UIKit

final class DisplaysSettingsViewMock: UIView, DisplaysSettingsView {
    // MARK: - configureTableView

    private(set) var configureTableViewWasCalled: Int = 0
    private(set) var configureTableViewReceivedManager: ManagesSettingsTable?
    
    func configureTableView(_ manager: ManagesSettingsTable) {
        configureTableViewWasCalled += 1
        configureTableViewReceivedManager = manager
    }
}

final class ManagesSettingsTableMock: NSObject, ManagesSettingsTable {
    // MARK: - numberOfRowsInSection
    
    private(set) var numberOfRowsInSectionWasCalled: Int = 0
    private(set) var numberOfRowsInSectionReceivedTableView: UITableView?
    private(set) var numberOfRowsInSectionReceivedSection: Int?
    var numberOfRowsInSectionStub: Int!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        numberOfRowsInSectionWasCalled += 1
        numberOfRowsInSectionReceivedTableView = tableView
        numberOfRowsInSectionReceivedSection = section
        return numberOfRowsInSectionStub
    }
    
    // MARK: - cellForRowAt
    
    private(set) var cellForRowAtWasCalled: Int = 0
    private(set) var cellForRowAtReceivedTableView: UITableView?
    private(set) var cellForRowAtReceivedIndexPath: IndexPath?
    var cellForRowAtStub: UITableViewCell!
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellForRowAtWasCalled += 1
        cellForRowAtReceivedTableView = tableView
        cellForRowAtReceivedIndexPath = indexPath
        return cellForRowAtStub
    }
}

