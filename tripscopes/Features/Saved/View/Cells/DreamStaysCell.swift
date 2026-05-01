//
//  DreamStaysCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 30/04/2026.
//

import Foundation
import UIKit
import SnapKit

class DreamStaysCell: UICollectionViewCell {

    static let reuseID = "DreamStaysCell"

//ELEMENTS
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()

    private lazy var headerView = BookingsSectionHeaderView(title: "Dream Stays", count: "2 SAVED")
    private lazy var amalfiCard = SavedStayCardView(style: .amalfi)
    private lazy var kyotoCard = SavedStayCardView(style: .kyoto)

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
        contentView.addSubview(stackView)

        stackView.addArrangedSubview(headerView)
        stackView.setCustomSpacing(16, after: headerView)
        stackView.addArrangedSubview(amalfiCard)
        stackView.addArrangedSubview(kyotoCard)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
