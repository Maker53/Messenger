//  Created by Stanislav Shalgin on 17.09.2023.

import UIKit

final class SettingsViewController: UIViewController {
    // MARK: - Views

    private lazy var contentView: DisplaysSettingsView = SettingsView()

    // MARK: - Lifecycle

    override func loadView() {
        view = contentView
    }
}
