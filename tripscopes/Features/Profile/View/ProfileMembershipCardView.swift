//
//  ProfileMembershipCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 03/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileMembershipCardView: UIView {

    private let cardPadding: CGFloat = 20
    private let starCircleSize: CGFloat = 44
    private let progressBarHeight: CGFloat = 8
    private let progressFraction: CGFloat = 0.6

//ELEMENTS
    private lazy var starCircleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.primary)
        view.layer.cornerRadius = starCircleSize / 2
        view.clipsToBounds = true
        return view
    }()

    private lazy var starIconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(
            systemName: "star.fill",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 18, weight: .semibold)
        )
        imageView.tintColor = UIColor(hex: Colors.white)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var tierTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary)
        label.text = "Explorer Tier"
        return label
    }()

    private lazy var pointsSubtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.tertiary600)
        label.text = "2,550 pts to reach Adventurer"
        label.numberOfLines = 2
        return label
    }()

    private lazy var textColumnStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [tierTitleLabel, pointsSubtitleLabel])
        stack.axis = .vertical
        stack.alignment = .leading
        stack.spacing = 4
        return stack
    }()

    private lazy var manageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Manage", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        button.setTitleColor(UIColor(hex: Colors.primary), for: .normal)
        button.contentHorizontalAlignment = .right
        return button
    }()

    private lazy var topRowContainer: UIView = {
        UIView()
    }()

    private lazy var progressTrackView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.neutral200)
        view.layer.cornerRadius = progressBarHeight / 2
        view.clipsToBounds = true
        return view
    }()

    private lazy var progressFillView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: Colors.primary)
        view.layer.cornerRadius = progressBarHeight / 2
        view.clipsToBounds = true
        return view
    }()

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

        starCircleView.addSubview(starIconView)
        progressTrackView.addSubview(progressFillView)

        topRowContainer.addSubview(starCircleView)
        topRowContainer.addSubview(textColumnStack)
        topRowContainer.addSubview(manageButton)

        addSubview(topRowContainer)
        addSubview(progressTrackView)

        manageButton.addAction(UIAction { _ in
            print("membership manage tapped")
        }, for: .touchUpInside)

        topRowContainer.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(cardPadding)
            make.leading.trailing.equalToSuperview().inset(cardPadding)
        }

        starCircleView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.height.equalTo(starCircleSize)
        }

        starIconView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(22)
        }

        textColumnStack.snp.makeConstraints { make in
            make.leading.equalTo(starCircleView.snp.trailing).offset(12)
            make.top.bottom.equalToSuperview()
            make.trailing.lessThanOrEqualTo(manageButton.snp.leading).offset(-8)
        }

        manageButton.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalTo(tierTitleLabel)
            make.width.greaterThanOrEqualTo(52)
        }

        progressTrackView.snp.makeConstraints { make in
            make.top.equalTo(topRowContainer.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(cardPadding)
            make.height.equalTo(progressBarHeight)
            make.bottom.equalToSuperview().inset(cardPadding)
        }

        progressFillView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(progressFraction)
        }
    }
}
