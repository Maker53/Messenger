//  Created by Stanislav Shalgin on 24.09.2023.

import UIKit

final class SettingsCoordinator: Coordinator {
    // MARK: - Internal Properties
    
    var parent: Coordinator?
    var childs: [Coordinator] = []
    
    // MARK: - Private Properties
    
    private let navigationController: UINavigationController
    
    // MARK: - Initializer
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Internal Methods
    
    func start() {
        let tableManager: ManagesSettingsTable = SettingsTableManager()
        let viewController: SettingsDisplayLogic = SettingsViewController(tableManager: tableManager)
        
        navigationController.pushViewController(viewController, animated: false)
    }
}
