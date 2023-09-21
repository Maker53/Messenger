//  Created by Stanislav Shalgin on 17.09.2023.

import UIKit

protocol DisplaysSettingsView: UIView, AnyObject { }

final class SettingsView: UIView {
    // MARK: - Views

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = Color.backgroundColorPrimary
        tableView.tableHeaderView = SettingsHeaderView()
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: - Private Properties

    private let barHeight: CGFloat?

    // MARK: - Lifecycle

    init(barHeight: CGFloat) {
        self.barHeight = barHeight
        super.init(frame: .zero)

        addSubviews()
        setupConstraints()
        backgroundColor = Color.backgroundColorPrimary
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - DisplaysSettingsView

extension SettingsView: DisplaysSettingsView { }

// MARK: - Private

private extension SettingsView {
    func addSubviews() {
        addSubview(tableView)
    }

    func setupConstraints() {
        let guide = safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: guide.topAnchor, constant: -(barHeight ?? 0) / 2),
            tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
