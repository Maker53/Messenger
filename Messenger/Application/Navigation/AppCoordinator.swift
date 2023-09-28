//  Created by Stanislav Shalgin on 24.09.2023.

import UIKit

final class AppCoordinator: Coordinator {
    // MARK: - Internal Properties
    
    var parent: Coordinator?
    var childs: [Coordinator] = []
    
    // MARK: - Private Properties
    
    private let window: UIWindow?
    private let tabBarController = UITabBarController()
    
    // MARK: - Initializer
    
    init(window: UIWindow?) {
        self.window = window
    }
    
    // MARK: - Internal Methods
    
    func start() {
        let settingsNavigationController = UINavigationController(rootViewController: SettingsViewController(tableManager: SettingsTableManager()))
        let settingsCoordinator: Coordinator = SettingsCoordinator(navigationController: settingsNavigationController)
        settingsCoordinator.parent = self

        childs.append(settingsCoordinator)
        
        settingsCoordinator.start()
        
        tabBarController.viewControllers = [settingsNavigationController]
        
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }
}
