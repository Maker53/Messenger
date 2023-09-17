//  Created by Stanislav Shalgin on 17.09.2023.

import UIKit

final class SettingsHeaderView: UIView {
    // MARK: - Views

    private lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
        return image
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "User name"
        return label
    }()

    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "+7 981 832 4143"
        return label
    }()

    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "@radimirovich"
        return label
    }()

    private lazy var dotView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.gray
        return view
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()

    // MARK: - Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = Color.backgroundColorPrimary
        addSubviews()
        setupConstraints()
        
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        dotView.layer.cornerRadius = dotView.bounds.width / 2
    }
}

// MARK: - Private

private extension SettingsHeaderView {
    func addSubviews() {
        userInfoStackView.addArrangedSubview(phoneLabel)
        userInfoStackView.addArrangedSubview(dotView)
        userInfoStackView.addArrangedSubview(accountLabel)

        contentStackView.addArrangedSubview(photoImageView)
        contentStackView.addArrangedSubview(nameLabel)
        contentStackView.addArrangedSubview(userInfoStackView)

        addSubview(contentStackView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            contentStackView.topAnchor.constraint(equalTo: topAnchor)
        ])
    }
}
