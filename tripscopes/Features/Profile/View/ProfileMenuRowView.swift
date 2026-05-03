//
//  ProfileMenuRowView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 03/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileMenuRowView: UIView {

    private let iconSymbolSize: CGFloat = 22
    private let verticalInset: CGFloat = 14

    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = UIColor(hex: Colors.tertiary)
        label.numberOfLines = 2
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()

    private lazy var trailingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(hex: Colors.tertiary600)
        label.textAlignment = .right
        label.setContentHuggingPriority(.required, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()

    private lazy var chevronView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(
            systemName: "chevron.right",
            withConfiguration: UIImage.SymbolConfiguration(pointSize: 14, weight: .semibold)
        )
        imageView.tintColor = UIColor(hex: Colors.tertiary400)
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        return imageView
    }()

    private lazy var trailingChevronStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [trailingLabel, chevronView])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        return stack
    }()

    private lazy var textTrailingStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, trailingChevronStack])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 8
        stack.distribution = .fill
        return stack
    }()

    private lazy var rowStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [iconView, textTrailingStack])
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 16
        return stack
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
        iconView.snp.makeConstraints { make in
            make.width.height.equalTo(iconSymbolSize + 4)
        }

        chevronView.snp.makeConstraints { make in
            make.width.height.equalTo(20)
        }

        addSubview(rowStack)

        rowStack.snp.makeConstraints { make in
            make.verticalEdges.equalToSuperview().inset(verticalInset)
            make.leading.trailing.equalToSuperview()
        }
    }

    func configure(iconName: String, title: String, trailingText: String?) {
        iconView.image = UIImage(
            systemName: iconName,
            withConfiguration: UIImage.SymbolConfiguration(pointSize: iconSymbolSize, weight: .semibold)
        )
        iconView.tintColor = UIColor(hex: Colors.primary)
        titleLabel.text = title

        if let trailingText, !trailingText.isEmpty {
            trailingLabel.text = trailingText
            trailingLabel.isHidden = false
        } else {
            trailingLabel.text = nil
            trailingLabel.isHidden = true
        }
    }
}
