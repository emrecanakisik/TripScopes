//
//  ProfileHeaderCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 02/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileHeaderCardView: UIView {

    private let cardPadding: CGFloat = 24
    private let avatarSize: CGFloat = 96
    private let avatarBadgeSize: CGFloat = 32

//ELEMENTS
    private lazy var avatarContainerView: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "mountain.2.fill",
                                  withConfiguration: UIImage.SymbolConfiguration(pointSize: 40, weight: .regular))
        imageView.tintColor = UIColor(hex: Colors.tertiary400)
        imageView.backgroundColor = UIColor(hex: Colors.neutral200)
        imageView.contentMode = .center
         imageView.layer.cornerRadius = avatarSize / 2
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var editBadgeView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.white)
        view.layer.cornerRadius = avatarBadgeSize / 2
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.10
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        return view
    }()

    private lazy var editBadgeIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "pencil",
                                  withConfiguration: UIImage.SymbolConfiguration(pointSize: 12, weight: .semibold))
        imageView.tintColor = UIColor(hex: Colors.primary)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var nameLabel: UILabel = makeInfoLabel(
        font: .systemFont(ofSize: 24, weight: .bold),
        textColor: UIColor(hex: Colors.tertiary)
    )

    private lazy var emailLabel: UILabel = makeInfoLabel(
        font: .systemFont(ofSize: 14, weight: .regular),
        textColor: UIColor(hex: Colors.tertiary500)
    )

    private lazy var identityStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel, emailLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()

    private lazy var bellIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "bell",
                                  withConfiguration: UIImage.SymbolConfiguration(pointSize: 22, weight: .regular))
        imageView.tintColor = UIColor(hex: Colors.tertiary600)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var notificationDotView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.secondary500)
        view.layer.cornerRadius = 5
        return view
    }()

    private lazy var tierLabel: UILabel = makePillLabel(
        font: .systemFont(ofSize: 14, weight: .semibold),
        textColor: UIColor(hex: Colors.primary)
    )

    private lazy var tierPillView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.primary100)
        view.layer.cornerRadius = 16
        return view
    }()

    private lazy var pointsLabel: UILabel = makePillLabel(
        font: .systemFont(ofSize: 14, weight: .semibold),
        textColor: UIColor(hex: Colors.primary)
    )

    private lazy var chevronIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "chevron.right",
                                  withConfiguration: UIImage.SymbolConfiguration(pointSize: 13, weight: .semibold))
        imageView.tintColor = UIColor(hex: Colors.primary)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var metaStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tierPillView, pointsLabel, chevronIcon])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 12
        return stack
    }()

//FACTORIES
    private func makeInfoLabel(font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.numberOfLines = 1
        return label
    }

    private func makePillLabel(font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = textColor
        label.textAlignment = .center
        return label
    }

//INIT
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//UI SETUP
    private func setupUI() {
        backgroundColor = UIColor(hex: Colors.white)

        nameLabel.text = "Emre Can Akisik"
        emailLabel.text = "emre.can.akisik@email.com"
        tierLabel.text = "Explorer"
        pointsLabel.text = "12,450 pts"

        avatarContainerView.addSubview(avatarImageView)
        avatarContainerView.addSubview(editBadgeView)
        editBadgeView.addSubview(editBadgeIcon)

        tierPillView.addSubview(tierLabel)

        addSubview(avatarContainerView)
        addSubview(identityStack)
        addSubview(metaStack)
        addSubview(bellIcon)
        addSubview(notificationDotView)

        avatarContainerView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(32)
            make.leading.equalToSuperview().inset(cardPadding)
            make.width.height.equalTo(avatarSize)
        }

        avatarImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        editBadgeView.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview().offset(2)
            make.width.height.equalTo(avatarBadgeSize)
        }

        editBadgeIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(14)
        }

        bellIcon.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(28)
            make.trailing.equalToSuperview().inset(cardPadding)
            make.width.height.equalTo(28)
        }

        notificationDotView.snp.makeConstraints { make in
            make.top.equalTo(bellIcon).offset(-1)
            make.trailing.equalTo(bellIcon).offset(3)
            make.width.height.equalTo(10)
        }

        identityStack.snp.makeConstraints { make in
            make.centerY.equalTo(avatarContainerView).offset(-8)
            make.leading.equalTo(avatarContainerView.snp.trailing).offset(20)
            make.trailing.lessThanOrEqualTo(bellIcon.snp.leading).offset(-12)
        }

        tierLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(6)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        metaStack.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(14)
            make.leading.equalTo(identityStack)
            make.trailing.lessThanOrEqualToSuperview().inset(cardPadding)
            make.bottom.equalToSuperview().inset(28)
        }

        chevronIcon.snp.makeConstraints { make in
            make.width.equalTo(10)
        }
    }
}
