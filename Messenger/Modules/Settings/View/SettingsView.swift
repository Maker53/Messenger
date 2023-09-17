//  Created by Stanislav Shalgin on 17.09.2023.

import UIKit

protocol DisplaysSettingsView: UIView, AnyObject { }

final class SettingsView: UIView {
    // MARK: - Initializers

    init() {
        super.init(frame: .zero)

        backgroundColor = .systemBackground
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DisplaysSettingsView

extension SettingsView: DisplaysSettingsView { }
