//  Created by Stanislav Shalgin on 17.09.2023.

import UIKit

protocol SettingsDisplayLogic: UIViewController, AnyObject { }

final class SettingsViewController: UIViewController {
    // MARK: - Views

    lazy var contentView: DisplaysSettingsView = {
        let view = SettingsView(barHeight: navigationController?.navigationBar.frame.height ?? 0.0)
        return view
    }()

    // MARK: - Internal Properties
    
    let tableManager: ManagesSettingsTable
    
    // MARK: - Initializers
    
    init(tableManager: ManagesSettingsTable) {
        self.tableManager = tableManager
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle

    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.configureTableView(tableManager)
        configureNavigationController()
    }
}

// MARK: - SettingsDisplayLogic

extension SettingsViewController: SettingsDisplayLogic { }

// MARK: - Private

private extension SettingsViewController {
    func configureNavigationController() {
        let leftBarButtonItem: UIBarButtonItem = .init(
            image: UIImage(systemName: "qrcode"),
            style: .plain,
            target: nil,
            action: nil
        )

        let rightBarButtonItem: UIBarButtonItem = .init(
            title: "Edit",
            style: .plain,
            target: nil,
            action: nil
        )

        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.leftBarButtonItem = leftBarButtonItem
        navigationController?.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
    }
}
