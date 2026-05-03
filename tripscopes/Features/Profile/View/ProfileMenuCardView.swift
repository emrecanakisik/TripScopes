//
//  ProfileMenuCardView.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 03/05/2026.
//

import Foundation
import UIKit
import SnapKit

class ProfileMenuCardView: UIView {

    private let cardPadding: CGFloat = 20
    private let titleToRowsSpacing: CGFloat = 8
    private let rowSpacing: CGFloat = 0

//ELEMENTS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary)
        return label
    }()

    private lazy var rowsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.spacing = rowSpacing
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

//FACTORIES
    private func makeRow(iconName: String, title: String, trailingText: String?) -> ProfileMenuRowView {
        let row = ProfileMenuRowView()
        row.configure(iconName: iconName, title: title, trailingText: trailingText)
        return row
    }

//UI SETUP
    private func setupUI() {
        backgroundColor = UIColor(hex: Colors.white)
        layer.cornerRadius = 32
        clipsToBounds = true

        addSubview(titleLabel)
        addSubview(rowsStack)

        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(cardPadding)
            make.leading.trailing.equalToSuperview().inset(cardPadding)
        }

        rowsStack.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(titleToRowsSpacing)
            make.leading.trailing.equalToSuperview().inset(cardPadding)
            make.bottom.equalToSuperview().inset(cardPadding)
        }
    }

    func configure(title: String, rows: [(iconName: String, title: String, trailingText: String?)]) {
        titleLabel.text = title
        rowsStack.arrangedSubviews.forEach { view in
            rowsStack.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
        for (_, spec) in rows.enumerated() {
            let row = makeRow(iconName: spec.iconName, title: spec.title, trailingText: spec.trailingText)
            rowsStack.addArrangedSubview(row)
        }
    }
}
