//  Created by Stanislav Shalgin on 24.09.2023.

import UIKit

final class UITableViewMock: UITableView {
    init() { super.init(frame: .zero, style: .plain) }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - numberOfRows
    
    private(set) var numberOfRowsWasCalled: Int = 0
    private(set) var numberOfRowsReceivedSection: Int?
    var numberOfRowsStub: Int!
    
    override func numberOfRows(inSection section: Int) -> Int {
        numberOfRowsWasCalled += 1
        numberOfRowsReceivedSection = section
        return numberOfRowsStub
    }
    
    // MARK: - cellForRow
    
    private(set) var cellForRowWasCalled: Int = 0
    private(set) var cellForRowReceivedIndexPath: IndexPath?
    var cellForRowStub: UITableViewCell!

    override func cellForRow(at indexPath: IndexPath) -> UITableViewCell? {
        cellForRowWasCalled += 1
        cellForRowReceivedIndexPath = indexPath
        return cellForRowStub
    }
    
    // MARK: - headerView
    
    private(set) var headerViewWasCalled: Int = 0
    private(set) var headerViewReceivedSection: Int?
    var headerViewStub: UITableViewHeaderFooterView!
    
    override func headerView(forSection section: Int) -> UITableViewHeaderFooterView? {
        headerViewWasCalled += 1
        headerViewReceivedSection = section
        return headerViewStub
    }
}
