//
//  TrackedFlightsCell.swift
//  tripscopes
//
//  Created by Emre Can Akisik on 30/04/2026.
//

import Foundation
import UIKit
import SnapKit

class TrackedFlightsCell: UICollectionViewCell {

    static let reuseID = "TrackedFlightsCell"

//ELEMENTS
    private lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 12
        stack.alignment = .fill
        stack.distribution = .fill
        return stack
    }()

    private lazy var headerView = BookingsSectionHeaderView(title: "Tracked Flights", count: "1 SAVED")
    private lazy var flightCard = SavedTrackedFlightCardView()

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
        stackView.addArrangedSubview(flightCard)

        stackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
