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
    private let titleToRowsSpacing: CGFloat = 20
    private let rowSpacing: CGFloat = 16

//ELEMENTS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = UIColor(hex: Colors.tertiary)
        label.text = "Quick Access"
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

        let savedRow = makeRow(iconName: "bookmark.fill", title: "Saved places", trailingText: nil)
        let bookingsRow = makeRow(iconName: "calendar.badge.clock", title: "Upcoming bookings", trailingText: "2")
        let paymentsRow = makeRow(iconName: "creditcard.fill", title: "Payments", trailingText: nil)

        [savedRow, bookingsRow, paymentsRow].forEach { rowsStack.addArrangedSubview($0) }

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
}
