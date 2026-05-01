//
//  SavedCuratedListCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 01/05/2026.
//

import Foundation
import UIKit
import SnapKit

class SavedCuratedListCardView: UIView {

    private let cardPadding: CGFloat = 20
    private let avatarSize: CGFloat = 24
    private let avatarOverlap: CGFloat = 12
    static let cardHeight: CGFloat = 280

//ELEMENTS
    private lazy var coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor(hex: Colors.primary300)
        imageView.image = UIImage(
            systemName: "photo.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 60, weight: .regular)
        )
        imageView.tintColor = UIColor(hex: Colors.primary100)
        return imageView
    }()

    private lazy var overlayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.35)
        return view
    }()

    private lazy var itineraryLabel: UILabel = makeOverlayLabel(
        font: .systemFont(ofSize: 11, weight: .bold),
        color: Colors.white
    )

    private lazy var titleLabel: UILabel = {
        let label = makeOverlayLabel(
            font: .systemFont(ofSize: 22, weight: .bold),
            color: Colors.white
        )
        label.numberOfLines = 0
        return label
    }()

    private lazy var sharedLabel: UILabel = makeOverlayLabel(
        font: .systemFont(ofSize: 12, weight: .semibold),
        color: Colors.white
    )

    private lazy var avatar1: UIImageView = makeAvatarView()
    private lazy var avatar2: UIImageView = makeAvatarView()
    private lazy var avatar3: UIImageView = makeAvatarView()

    private lazy var avatarsContainer: UIView = UIView()

    private lazy var sharedInfoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [avatarsContainer, sharedLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()

    private lazy var bottomStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, sharedInfoStack])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 12
        return stack
    }()

    private lazy var favoriteButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(
            systemName: "heart.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .regular)
        )
        config.baseForegroundColor = UIColor(hex: Colors.secondary500)
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        let button = UIButton(configuration: config)
        button.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        button.layer.cornerRadius = 18
        button.clipsToBounds = true
        return button
    }()

//FACTORIES
    private func makeOverlayLabel(font: UIFont, color: String) -> UILabel {
        let label = UILabel()
        label.font = font
        label.textColor = UIColor(hex: color)
        return label
    }

    private func makeAvatarView() -> UIImageView {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(hex: Colors.neutral200)
        imageView.tintColor = UIColor(hex: Colors.tertiary600)
        imageView.image = UIImage(
            systemName: "person.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 12, weight: .semibold)
        )
        imageView.contentMode = .center
        imageView.layer.cornerRadius = avatarSize / 2
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor(hex: Colors.white).cgColor
        imageView.clipsToBounds = true
        return imageView
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
        layer.cornerRadius = 32
        clipsToBounds = true

        itineraryLabel.text = "7 DAYS ITINERARY"
        titleLabel.text = "The Ultimate Amalfi Road Trip"
        sharedLabel.text = "Shared with 12 others"

        favoriteButton.addAction(UIAction(handler: { _ in
            print("Curated list favorite tapped")
        }), for: .touchUpInside)

        addSubview(coverImageView)
        addSubview(overlayView)
        addSubview(itineraryLabel)
        addSubview(favoriteButton)
        addSubview(bottomStack)

        avatarsContainer.addSubview(avatar1)
        avatarsContainer.addSubview(avatar2)
        avatarsContainer.addSubview(avatar3)

        snp.makeConstraints { make in
            make.height.equalTo(SavedCuratedListCardView.cardHeight)
        }

        coverImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        overlayView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        itineraryLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(cardPadding)
            make.leading.equalToSuperview().inset(cardPadding)
            make.trailing.lessThanOrEqualTo(favoriteButton.snp.leading).offset(-8)
        }

        favoriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(cardPadding - 4)
            make.trailing.equalToSuperview().inset(cardPadding - 4)
            make.width.height.equalTo(36)
        }

        bottomStack.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(cardPadding)
            make.trailing.lessThanOrEqualToSuperview().inset(cardPadding)
            make.bottom.equalToSuperview().inset(cardPadding)
        }

        avatar1.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.height.equalTo(avatarSize)
        }

        avatar2.snp.makeConstraints { make in
            make.leading.equalTo(avatar1.snp.trailing).offset(-avatarOverlap)
            make.centerY.equalTo(avatar1)
            make.width.height.equalTo(avatarSize)
        }

        avatar3.snp.makeConstraints { make in
            make.leading.equalTo(avatar2.snp.trailing).offset(-avatarOverlap)
            make.centerY.equalTo(avatar1)
            make.trailing.equalToSuperview()
            make.width.height.equalTo(avatarSize)
        }
    }
}
