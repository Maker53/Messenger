//  Created by Stanislav Shalgin on 23.09.2023.

import UIKit

protocol ManagesSettingsTable: AnyObject, UITableViewDataSource, UITableViewDelegate { }

final class SettingsTableManager: NSObject, ManagesSettingsTable {
    // MARK: - Private Properties
    
    private lazy var tableHeaderView = SettingsHeaderView(frame: .zero)
    
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        tableHeaderView
    }
}
