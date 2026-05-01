//
//  SavedStayCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 30/04/2026.
//

import Foundation
import UIKit
import SnapKit

enum SavedStayStyle {
    case amalfi
    case kyoto

    var category: String {
        switch self {
        case .amalfi: return "AMALFI COAST"
        case .kyoto:  return "KYOTO, JAPAN"
        }
    }

    var name: String {
        switch self {
        case .amalfi: return "Hotel Santa Caterina"
        case .kyoto:  return "The Ritz-Carlton"
        }
    }

    var rating: String {
        switch self {
        case .amalfi: return "4.9"
        case .kyoto:  return "5.0"
        }
    }

    var price: String {
        switch self {
        case .amalfi: return "$850/night"
        case .kyoto:  return "$1,200/night"
        }
    }

    var thumbnailIconName: String {
        switch self {
        case .amalfi: return "mountain.2.fill"
        case .kyoto:  return "mountain.2.fill"
        }
    }

    var thumbnailBackgroundColor: String {
        switch self {
        case .amalfi: return Colors.tertiary800
        case .kyoto:  return Colors.tertiary800
        }
    }

    var thumbnailIconColor: String {
        switch self {
        case .amalfi: return Colors.neutral200
        case .kyoto:  return Colors.neutral200
        }
    }
}

class SavedStayCardView: UIView {

    private let cardPadding: CGFloat = 16
    private let thumbnailSize: CGFloat = 110
    static let cardHeight: CGFloat = 142

//ELEMENTS
    private lazy var thumbnailImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 16
        imageView.clipsToBounds = true
        return imageView
    }()

    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        label.textColor = UIColor(hex: Colors.secondary600)
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary)
        label.numberOfLines = 1
        return label
    }()

    private lazy var starIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "star")
        imageView.tintColor = UIColor(hex: Colors.primary)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private func makeMetaLabel(weight: UIFont.Weight, color: String) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: weight)
        label.textColor = UIColor(hex: color)
        return label
    }

    private lazy var ratingLabel: UILabel = makeMetaLabel(weight: .semibold, color: Colors.primary)
    private lazy var separatorLabel: UILabel = makeMetaLabel(weight: .bold, color: Colors.neutral400)
    private lazy var priceLabel: UILabel = makeMetaLabel(weight: .semibold, color: Colors.primary)

    private lazy var metaStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [starIcon, ratingLabel, separatorLabel, priceLabel])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 6
        return stack
    }()

    private lazy var infoStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [categoryLabel, nameLabel, metaStack])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        stack.setCustomSpacing(8, after: nameLabel)
        return stack
    }()

    private lazy var favoriteButton: UIButton = {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(systemName: "heart.fill",
                               withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .regular))
        config.baseForegroundColor = UIColor(hex: Colors.secondary500)
        config.contentInsets = NSDirectionalEdgeInsets(top: 4, leading: 4, bottom: 4, trailing: 4)
        let button = UIButton(configuration: config)
        button.setContentHuggingPriority(.required, for: .horizontal)
        button.setContentCompressionResistancePriority(.required, for: .horizontal)
        return button
    }()

//INIT
    init(style: SavedStayStyle) {
        super.init(frame: .zero)
        setupUI()
        apply(style: style)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        apply(style: .amalfi)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//UI SETUP
    private func setupUI() {
        backgroundColor = UIColor(hex: Colors.white)
        layer.cornerRadius = 28
        clipsToBounds = true

        separatorLabel.text = "·"

        favoriteButton.addAction(UIAction(handler: { _ in
            print("Saved stay favorite tapped")
        }), for: .touchUpInside)

        addSubview(thumbnailImageView)
        addSubview(infoStack)
        addSubview(favoriteButton)

        snp.makeConstraints { make in
            make.height.equalTo(SavedStayCardView.cardHeight)
        }

        thumbnailImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(cardPadding)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(thumbnailSize)
        }

        starIcon.snp.makeConstraints { make in
            make.width.height.equalTo(14)
        }

        favoriteButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(cardPadding - 4)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }

        infoStack.snp.makeConstraints { make in
            make.leading.equalTo(thumbnailImageView.snp.trailing).offset(14)
            make.centerY.equalToSuperview()
            make.trailing.lessThanOrEqualTo(favoriteButton.snp.leading).offset(-8)
        }
    }

//STYLE
    func apply(style: SavedStayStyle) {
        thumbnailImageView.backgroundColor = UIColor(hex: style.thumbnailBackgroundColor)
        thumbnailImageView.tintColor = UIColor(hex: style.thumbnailIconColor)
        thumbnailImageView.image = UIImage(
            systemName: style.thumbnailIconName,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 38, weight: .regular)
        )
        categoryLabel.text = style.category
        nameLabel.text = style.name
        ratingLabel.text = style.rating
        priceLabel.text = style.price

        DispatchQueue.main.async {
    print("thumbnail frame: \(self.thumbnailImageView.frame)")
    print("thumbnail bounds: \(self.thumbnailImageView.bounds)")
}
    }
}
