//  Created by Stanislav Shalgin on 21.09.2023.

import XCTest
@testable import Messenger

final class SettingsHeaderViewTests: XCTestCase {
    var view: SettingsHeaderView!

    override func setUpWithError() throws {
        try super.setUpWithError()

        view = SettingsHeaderView()
    }

    override func tearDownWithError() throws {
        view = nil

        try super.tearDownWithError()
    }

    func testInit() {
        // then
        let photoImageView: UIImageView! = Mirror.reflectProperty(of: view!, name: "photoImageView")
        let nameLabel: UILabel! = Mirror.reflectProperty(of: view!, name: "nameLabel")
        let phoneLabel: UILabel! = Mirror.reflectProperty(of: view!, name: "phoneLabel")
        let accountLabel: UILabel! = Mirror.reflectProperty(of: view!, name: "accountLabel")
        let dotView: UIView! = Mirror.reflectProperty(of: view!, name: "dotView")
        let contentStackView: UIStackView! = Mirror.reflectProperty(of: view!, name: "contentStackView")
        let userInfoStackView: UIStackView! = Mirror.reflectProperty(of: view!, name: "userInfoStackView")

        XCTAssert(view.backgroundColor == TestData.backgroundColor)
        
        XCTAssert(photoImageView.image == TestData.photoImage)
        XCTAssertTrue(photoImageView.clipsToBounds)
        
        XCTAssert(nameLabel.text == TestData.nameText)
        XCTAssert(nameLabel.font == TestData.nameFont)
        
        XCTAssert(phoneLabel.text == TestData.phoneText)
        XCTAssert(phoneLabel.textColor == TestData.grayTextColor)
        
        XCTAssert(accountLabel.text == TestData.accountText)
        XCTAssert(accountLabel.textColor == TestData.grayTextColor)
        
        XCTAssert(dotView.backgroundColor?.cgColor == TestData.dotViewColor.cgColor)
        XCTAssertFalse(dotView.translatesAutoresizingMaskIntoConstraints)

        XCTAssert(contentStackView.axis == TestData.contentStackViewAxis)
        XCTAssert(contentStackView.alignment == TestData.stackViewAligment)
        XCTAssertFalse(contentStackView.translatesAutoresizingMaskIntoConstraints)

        XCTAssert(userInfoStackView.axis == TestData.userInfoStackViewAxis)
        XCTAssert(userInfoStackView.alignment == TestData.stackViewAligment)
        XCTAssert(userInfoStackView.spacing == TestData.userInfoStackViewSpacing)
    }
}

// MARK: - TestData

private extension SettingsHeaderViewTests {
    enum TestData {
        static let backgroundColor = Color.backgroundColorPrimary
        static let dotViewColor = Color.gray
        static let photoImage = UIImage(systemName: "person")
        static let nameText = "User name"
        static let nameFont = UIFont.systemFont(ofSize: 27, weight: .semibold)
        static let phoneText = "+7 981 832 4143"
        static let grayTextColor = Color.gray
        static let accountText = "@radimirovich"
        static let contentStackViewAxis: NSLayoutConstraint.Axis = .vertical
        static let stackViewAligment: UIStackView.Alignment = .center
        static let userInfoStackViewAxis: NSLayoutConstraint.Axis = .horizontal
        static let userInfoStackViewSpacing: CGFloat = 5
    }
}
