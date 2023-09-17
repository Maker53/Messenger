//  Created by Stanislav Shalgin on 17.09.2023.

import UIKit

protocol SettingsDisplayLogic: UIViewController, AnyObject {
    func configureNavigationBar()
}

final class SettingsViewController: UIViewController {
    // MARK: - Views

    private lazy var contentView: DisplaysSettingsView = SettingsView()
    private lazy var leftBarButtonItem: UIBarButtonItem = .init(
        image: UIImage(systemName: "qrcode"),
        style: .plain,
        target: nil,
        action: nil
    )

    private lazy var rightBarButtonItem: UIBarButtonItem = .init(
        title: "Edit",
        style: .plain,
        target: nil,
        action: nil
    )

    // MARK: - Lifecycle

    override func loadView() {
        view = contentView
    }
}

// MARK: - SettingsDisplayLogic

extension SettingsViewController: SettingsDisplayLogic {
    func configureNavigationBar() {
        navigationItem.rightBarButtonItem = rightBarButtonItem
        navigationItem.leftBarButtonItem = leftBarButtonItem
    }
}
