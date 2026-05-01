//
//  SavedTrackedFlightCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 30/04/2026.
//

import Foundation
import UIKit
import SnapKit

class SavedTrackedFlightCardView: UIView {

    private let cardPadding: CGFloat = 20
    private let iconContainerSize: CGFloat = 36

//ELEMENTS

    private lazy var airlineIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "airplane")
        imageView.tintColor = UIColor(hex: Colors.primary)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var airlineIconContainer: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.primary100)
        view.layer.cornerRadius = iconContainerSize / 2
        return view
    }()

    private lazy var routeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary)
        return label
    }()

    private lazy var metaLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = UIColor(hex: Colors.tertiary600)
        return label
    }()

    private lazy var infoStack: UIStackView = makeInfoStack(
        arrangedSubviews: [routeLabel, metaLabel]
    )

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

    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.neutral200)
        return view
    }()

    private lazy var priceTitleLabel: UILabel = makePriceTitleLabel()
    private lazy var priceValueLabel: UILabel = makePriceValueLabel()

    private lazy var priceStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [priceTitleLabel, priceValueLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()

    private lazy var lowestPriceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        label.textColor = UIColor(hex: Colors.secondary700)
        label.textAlignment = .center
        return label
    }()

    private lazy var lowestPricePill: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.secondary100)
        view.layer.cornerRadius = 12
        return view
    }()

//FACTORIES
    private func makeInfoStack(arrangedSubviews: [UIView]) -> UIStackView {
        let stack = UIStackView(arrangedSubviews: arrangedSubviews)
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 2
        return stack
    }

    private func makePriceTitleLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 11, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary600)
        return label
    }

    private func makePriceValueLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary)
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
        layer.cornerRadius = 32
        clipsToBounds = true

        routeLabel.text = "LHR → HND"
        metaLabel.text = "Oct 12 - Oct 24 · British Airways"
        priceTitleLabel.text = "CURRENT PRICE"
        priceValueLabel.text = "$1,042"
        lowestPriceLabel.text = "Lowest in 30 days"

        favoriteButton.addAction(UIAction(handler: { _ in
            print("Tracked flight favorite tapped")
        }), for: .touchUpInside)

        airlineIconContainer.addSubview(airlineIcon)
        lowestPricePill.addSubview(lowestPriceLabel)


        addSubview(airlineIconContainer)
        addSubview(infoStack)
        addSubview(favoriteButton)
        addSubview(divider)
        addSubview(priceStack)
        addSubview(lowestPricePill)


        airlineIconContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(cardPadding)
            make.leading.equalToSuperview().inset(cardPadding)
            make.width.height.equalTo(iconContainerSize)
        }

        airlineIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(18)
        }

        favoriteButton.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(cardPadding - 4)
            make.trailing.equalToSuperview().inset(cardPadding - 4)
            make.width.height.equalTo(36)
        }

        infoStack.snp.makeConstraints { make in
            make.centerY.equalTo(airlineIconContainer)
            make.leading.equalTo(airlineIconContainer.snp.trailing).offset(12)
            make.trailing.lessThanOrEqualTo(favoriteButton.snp.leading).offset(-8)
        }

        divider.snp.makeConstraints { make in
            make.top.equalTo(airlineIconContainer.snp.bottom).offset(20)
            make.leading.equalToSuperview().inset(cardPadding)
            make.trailing.equalToSuperview().inset(cardPadding)
            make.height.equalTo(1)
        }

        priceStack.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(cardPadding)
            make.bottom.equalToSuperview().inset(cardPadding)
        }

        lowestPriceLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(6)
            make.leading.trailing.equalToSuperview().inset(12)
        }

        lowestPricePill.snp.makeConstraints { make in
            make.centerY.equalTo(priceValueLabel)
            make.trailing.equalToSuperview().inset(cardPadding)
            make.leading.greaterThanOrEqualTo(priceStack.snp.trailing).offset(8)
        }
    }
}
