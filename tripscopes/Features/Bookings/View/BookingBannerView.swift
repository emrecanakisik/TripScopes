//
//  BookingBannerView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 28/04/2026.
//

import Foundation
import UIKit
import SnapKit

enum BookingBannerStyle {
    case concierge
    case upgrade

    var backgroundColor: UIColor {
        switch self {
        case .concierge: return UIColor(hex: Colors.primary700)
        case .upgrade:   return UIColor(hex: Colors.secondary200)
        }
    }

    var title: String {
        switch self {
        case .concierge: return "Need help with your trip?"
        case .upgrade:   return "Upgrade to Business"
        }
    }

    var titleColor: UIColor {
        switch self {
        case .concierge: return UIColor(hex: Colors.white)
        case .upgrade:   return UIColor(hex: Colors.secondary800)
        }
    }

    var subtitle: String {
        switch self {
        case .concierge: return "Our 24/7 concierge is ready to assist you anywhere in the world."
        case .upgrade:   return "Experience superior comfort on your flight to Tokyo for only $249."
        }
    }

    var subtitleColor: UIColor {
        switch self {
        case .concierge: return UIColor(hex: Colors.white).withAlphaComponent(0.85)
        case .upgrade:   return UIColor(hex: Colors.secondary700)
        }
    }

    var buttonTitle: String {
        switch self {
        case .concierge: return "Chat Now"
        case .upgrade:   return "Upgrade"
        }
    }

    var buttonBackgroundColor: UIColor {
        switch self {
        case .concierge: return UIColor(hex: Colors.white)
        case .upgrade:   return UIColor(hex: Colors.secondary700)
        }
    }

    var buttonTextColor: UIColor {
        switch self {
        case .concierge: return UIColor(hex: Colors.primary)
        case .upgrade:   return UIColor(hex: Colors.white)
        }
    }

    var decorationIconName: String {
        switch self {
        case .concierge: return "bubble.left.and.bubble.right.fill"
        case .upgrade:   return "sparkles"
        }
    }

    var decorationTintColor: UIColor {
        switch self {
        case .concierge: return UIColor(hex: Colors.white).withAlphaComponent(0.15)
        case .upgrade:   return UIColor(hex: Colors.secondary700).withAlphaComponent(0.25)
        }
    }
}

class BookingBannerView: UIView {

    private let bannerPadding: CGFloat = 20

//ELEMENTS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        return label
    }()

    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .regular)
        label.numberOfLines = 0
        return label
    }()

    private lazy var actionButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.cornerStyle = .fixed
        config.background.cornerRadius = 20
        config.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 18, bottom: 10, trailing: 18)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
            return outgoing
        }
        let button = UIButton(configuration: config)
        button.setContentHuggingPriority(.required, for: .horizontal)
        return button
    }()

    private lazy var decorationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

//INIT
    init(style: BookingBannerStyle) {
        super.init(frame: .zero)
        setupUI()
        apply(style: style)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        apply(style: .concierge)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//UI SETUP
    private func setupUI() {
        layer.cornerRadius = 24
        clipsToBounds = true

        actionButton.addAction(UIAction(handler: { _ in
            print("Banner action tapped")
        }), for: .touchUpInside)

        addSubview(decorationIcon)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(actionButton)

        decorationIcon.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(20)
            make.width.height.equalTo(130)
        }

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(bannerPadding)
            make.leading.equalToSuperview().inset(bannerPadding)
            make.trailing.lessThanOrEqualToSuperview().inset(bannerPadding + 60)
        }

        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(6)
            make.leading.equalToSuperview().inset(bannerPadding)
            make.trailing.lessThanOrEqualToSuperview().inset(bannerPadding + 40)
        }

        actionButton.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(14)
            make.leading.equalToSuperview().inset(bannerPadding)
            make.bottom.equalToSuperview().inset(bannerPadding)
            make.trailing.lessThanOrEqualToSuperview().inset(bannerPadding + 100)
        }
    }

//STYLE
    func apply(style: BookingBannerStyle) {
        backgroundColor = style.backgroundColor

        titleLabel.text = style.title
        titleLabel.textColor = style.titleColor

        subtitleLabel.text = style.subtitle
        subtitleLabel.textColor = style.subtitleColor

        var config = actionButton.configuration ?? UIButton.Configuration.filled()
        config.baseBackgroundColor = style.buttonBackgroundColor
        config.baseForegroundColor = style.buttonTextColor
        actionButton.configuration = config
        actionButton.setTitle(style.buttonTitle, for: .normal)

        decorationIcon.image = UIImage(systemName: style.decorationIconName)
        decorationIcon.tintColor = style.decorationTintColor
    }
}
