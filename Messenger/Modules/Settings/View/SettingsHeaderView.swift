//  Created by Stanislav Shalgin on 17.09.2023.

import UIKit

final class SettingsHeaderView: UIView {
    // MARK: - Views

    private lazy var photoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
        image.clipsToBounds = true
        return image
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "User name"
        label.font = .systemFont(ofSize: 27, weight: .semibold)
        return label
    }()

    private lazy var phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "+7 981 832 4143"
        label.textColor = Color.gray
        return label
    }()

    private lazy var accountLabel: UILabel = {
        let label = UILabel()
        label.text = "@radimirovich"
        label.textColor = Color.gray
        return label
    }()

    private lazy var dotView: UIView = {
        let view = UIView()
        view.backgroundColor = Color.gray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var userInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.spacing = 5
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
        photoImageView.layer.cornerRadius = photoImageView.bounds.width / 2
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
            contentStackView.topAnchor.constraint(equalTo: topAnchor),
            
            photoImageView.widthAnchor.constraint(equalToConstant: 90),
            photoImageView.heightAnchor.constraint(equalToConstant: 90),
            
            dotView.widthAnchor.constraint(equalToConstant: 4),
            dotView.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
}
