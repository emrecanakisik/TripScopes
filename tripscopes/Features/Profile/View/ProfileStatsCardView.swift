//
//  ProfileStatsCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 03/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileStatsCardView: UIView {

    private let cardPadding: CGFloat = 20
    private let iconCircleSize: CGFloat = 44
    private let iconSymbolSize: CGFloat = 18

    private static let countriesIconBackground = "#E3F4EC"
    private static let savedIconBackground = "#FCE7F3"

//ELEMENTS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary)
        label.text = "Your Travel Stats"
        return label
    }()

    private lazy var viewAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("View all", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(UIColor(hex: Colors.primary), for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    }()

    private lazy var headerRow: UIView = {
        let view = UIView()
        return view
    }()

    private lazy var statsStack: UIStackView = {
        let trips = makeStatItem(
            iconName: "suitcase.fill",
            iconTint: Colors.primary,
            iconBackground: Colors.primary100,
            value: "10",
            label: "Trips"
        )
        let countries = makeStatItem(
            iconName: "globe.europe.africa.fill",
            iconTint: "#15803D",
            iconBackground: Self.countriesIconBackground,
            value: "7",
            label: "Countries"
        )
        let flights = makeStatItem(
            iconName: "airplane",
            iconTint: Colors.secondary600,
            iconBackground: Colors.secondary100,
            value: "15",
            label: "Flights"
        )
        let saved = makeStatItem(
            iconName: "heart.fill",
            iconTint: "#BE185D",
            iconBackground: Self.savedIconBackground,
            value: "8",
            label: "Saved"
        )

        let stack = UIStackView(arrangedSubviews: [trips, countries, flights, saved])
        stack.axis = .horizontal
        stack.alignment = .top
        stack.distribution = .fillEqually
        stack.spacing = 8
        return stack
    }()

//FACTORIES
    private func makeStatItem(iconName: String,
                              iconTint: String,
                              iconBackground: String,
                              value: String,
                              label: String) -> UIView {
        let iconBackdrop = UIView()
        iconBackdrop.backgroundColor = UIColor(hex: iconBackground)
        iconBackdrop.layer.cornerRadius = iconCircleSize / 2

        let iconView = UIImageView()
        iconView.image = UIImage(
            systemName: iconName,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: iconSymbolSize, weight: .semibold)
        )
        iconView.tintColor = UIColor(hex: iconTint)
        iconView.contentMode = .scaleAspectFit

        iconBackdrop.addSubview(iconView)
        iconView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(22)
        }
        iconBackdrop.snp.makeConstraints { make in
            make.width.height.equalTo(iconCircleSize)
        }

        let valueLabel = UILabel()
        valueLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        valueLabel.textColor = UIColor(hex: Colors.tertiary800)
        valueLabel.text = value
        valueLabel.textAlignment = .center

        let captionLabel = UILabel()
        captionLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        captionLabel.textColor = UIColor(hex: Colors.tertiary600)
        captionLabel.text = label
        captionLabel.textAlignment = .center
        captionLabel.numberOfLines = 2

        let stack = UIStackView(arrangedSubviews: [iconBackdrop, valueLabel, captionLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8
        stack.setCustomSpacing(12, after: iconBackdrop)
        return stack
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

        headerRow.addSubview(titleLabel)
        headerRow.addSubview(viewAllButton)
        addSubview(headerRow)
        addSubview(statsStack)

        viewAllButton.addAction(UIAction { _ in
            print("view all tapped")
        }, for: .touchUpInside)

        headerRow.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(cardPadding)
            make.leading.trailing.equalToSuperview().inset(cardPadding)
        }

        titleLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.bottom.equalToSuperview()
        }

        viewAllButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(titleLabel)
            make.leading.greaterThanOrEqualTo(titleLabel.snp.trailing).offset(8)
        }

        statsStack.snp.makeConstraints { make in
            make.top.equalTo(headerRow.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(cardPadding)
            make.bottom.equalToSuperview().inset(cardPadding)
        }
    }
}
