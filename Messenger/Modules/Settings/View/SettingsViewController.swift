//  Created by Stanislav Shalgin on 17.09.2023.

import UIKit

protocol SettingsDisplayLogic: UIViewController, AnyObject {
    func configureNavigationBar()
}

final class SettingsViewController: UIViewController {
    // MARK: - Views

    private lazy var contentView: DisplaysSettingsView = SettingsView(
        barHeight: navigationController?.navigationBar.frame.height
    )

    // MARK: - Lifecycle

    override func loadView() {
        view = contentView
    }
}

// MARK: - SettingsDisplayLogic

extension SettingsViewController: SettingsDisplayLogic {
    func configureNavigationBar() {
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
    }
}
